<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class ImportSqlDump extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'db:import-dump {file}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Import MySQL dump into PostgreSQL database';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $filePath = $this->argument('file');
        if (!file_exists($filePath)) {
            $this->error("File not found: $filePath");
            return 1;
        }

        $this->info("Reading SQL dump from $filePath...");
        $content = file_get_contents($filePath);

        // Standardize line endings
        $content = str_replace("\r\n", "\n", $content);

        // Find all INSERT INTO statement blocks
        preg_match_all('/INSERT INTO\s+`([^`]+)`\s*\(([^)]+)\)\s*VALUES\s*(.*?);/s', $content, $matches, PREG_SET_ORDER);

        $this->info("Found " . count($matches) . " INSERT statements.");

        foreach ($matches as $match) {
            $table = $match[1];
            $columnsStr = $match[2];
            $valuesStr = $match[3];

            if ($table === 'migrations') {
                $this->info("Skipping migrations table.");
                continue;
            }

            $this->info("Importing into table: $table");

            // Clean columns: replace backticks with double quotes or remove them
            $columns = str_replace('`', '"', $columnsStr);

            // MySQL escapes strings using \', but Postgres needs ''
            $cleanedValues = str_replace("\\'", "''", $valuesStr);
            $cleanedValues = str_replace('\\"', '"', $cleanedValues);

            // Reconstruct insert statement compatible with PostgreSQL
            $query = "INSERT INTO \"$table\" ($columns) VALUES $cleanedValues;";

            try {
                // Clear the table first to avoid duplicate primary keys
                DB::table($table)->truncate();
                $this->info("Truncated table: $table");
            } catch (\Exception $e) {
                try {
                    DB::table($table)->delete();
                    $this->info("Cleared table using DELETE: $table");
                } catch (\Exception $e2) {
                    $this->warn("Could not clear table $table: " . $e2->getMessage());
                }
            }

            try {
                DB::unprepared($query);
                $this->info("Successfully imported $table.");
            } catch (\Exception $e) {
                $this->error("Failed to import $table: " . $e->getMessage());
                $this->error("Query snippet: " . substr($query, 0, 500) . "...");
            }

            // Reset sequence in PostgreSQL to avoid autoincrement errors on next inserts
            if (config('database.default') === 'pgsql') {
                try {
                    $maxId = DB::table($table)->max('id');
                    if ($maxId) {
                        DB::statement("SELECT setval(pg_get_serial_sequence('$table', 'id'), $maxId);");
                        $this->info("Reset sequence for $table to $maxId.");
                    }
                } catch (\Exception $e) {
                    $this->warn("Could not reset sequence for $table: " . $e->getMessage());
                }
            }
        }

        $this->info("Import process completed!");
        return 0;
    }
}
