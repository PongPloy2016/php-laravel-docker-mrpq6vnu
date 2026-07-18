<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class MakeUserquizNullableInSettingsTable extends Migration
{
    public function up()
    {
        if (Schema::hasTable('settings')) {
            if (config('database.default') === 'pgsql') {
                DB::statement('ALTER TABLE settings ALTER COLUMN userquiz DROP NOT NULL;');
            } else {
                DB::statement('ALTER TABLE settings MODIFY COLUMN userquiz TINYINT NULL;');
            }
        }
    }

    public function down()
    {
        //
    }
}
