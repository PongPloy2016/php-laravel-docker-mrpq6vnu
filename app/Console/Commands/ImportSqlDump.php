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

        // Find all INSERT INTO statement blocks (matching until a semicolon followed by a newline or end of file)
        preg_match_all('/INSERT INTO\s+`([^`]+)`\s*\(([^)]+)\)\s*VALUES\s*(.*?);(?:\n|$)/s', $content, $matches, PREG_SET_ORDER);

        $this->info("Found " . count($matches) . " INSERT statements.");

        $isPgsql = (config('database.default') === 'pgsql');

        // Order tables based on dependencies to avoid foreign key violations on any database
        $tableOrder = [
            'topics',
            'users',
            'questions',
            'answers',
            'authentication_log',
            'sessions'
        ];

        usort($matches, function($a, $b) use ($tableOrder) {
            $tableA = $a[1];
            $tableB = $b[1];

            $posA = array_search($tableA, $tableOrder);
            $posB = array_search($tableB, $tableOrder);

            $posA = ($posA === false) ? -1 : $posA;
            $posB = ($posB === false) ? -1 : $posB;

            return $posA <=> $posB;
        });

        foreach ($matches as $match) {
                $table = $match[1];
                $columnsStr = $match[2];
                $valuesStr = $match[3];

                if ($table === 'migrations') {
                    $this->info("Skipping migrations table.");
                    continue;
                }

                $this->info("Importing into table: $table");

                // Parse columns list
                $columns = array_map(function($col) {
                    return trim($col, ' "`\'');
                }, explode(',', $columnsStr));

                // Get boolean columns if pgsql to cast them properly
                $booleanColumns = [];
                if ($isPgsql) {
                    try {
                        $booleanColumns = collect(DB::select("
                            SELECT column_name 
                            FROM information_schema.columns 
                            WHERE table_name = :table 
                              AND data_type = 'boolean'
                        ", ['table' => $table]))->pluck('column_name')->toArray();
                    } catch (\Exception $e) {
                        $this->warn("Could not fetch boolean columns: " . $e->getMessage());
                    }
                }

                // Clean up values block: normalize newlines
                $valuesStr = str_replace("\r\n", "\n", $valuesStr);
                $trimmedValues = trim($valuesStr);
                if (substr($trimmedValues, 0, 1) === '(') {
                    $trimmedValues = substr($trimmedValues, 1);
                }
                if (substr($trimmedValues, -1) === ')') {
                    $trimmedValues = substr($trimmedValues, 0, -1);
                }

                // Split into individual rows using the row separator "),\\n("
                $rows = explode("),\n(", $trimmedValues);
                $this->info("Parsing " . count($rows) . " rows for table $table...");

                $rowData = [];
                foreach ($rows as $rowIndex => $rowLine) {
                    // Use PHP's built-in CSV parser to properly handle escaped quotes and commas
                    $parsedValues = str_getcsv($rowLine, ',', "'", "\\");

                    $rowMap = [];
                    foreach ($columns as $index => $col) {
                        $val = isset($parsedValues[$index]) ? $parsedValues[$index] : null;
                        if ($val !== null) {
                            $val = trim($val);
                        }

                        // Standardize null values
                        if ($val === 'NULL' || $val === 'null' || $val === null) {
                            $rowMap[$col] = null;
                        } else {
                            // Cast boolean columns appropriately
                            if (in_array($col, $booleanColumns)) {
                                $rowMap[$col] = ($val === '1' || $val === 1 || strtolower($val) === 'true');
                            } else {
                                $rowMap[$col] = $val;
                            }
                        }
                    }
                    $rowData[] = $rowMap;
                }
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
                    // Insert rows in chunks of 100 to optimize performance
                    foreach (array_chunk($rowData, 100) as $chunk) {
                        DB::table($table)->insert($chunk);
                    }
                    $this->info("Successfully imported $table.");
                } catch (\Exception $e) {
                    $this->error("Failed to import $table: " . $e->getMessage());
                }

                // Reset sequence in PostgreSQL to avoid autoincrement errors on next inserts
                if ($isPgsql) {
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
