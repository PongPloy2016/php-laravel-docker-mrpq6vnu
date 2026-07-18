<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class MakeDeleteRequestNullableInUsersTable extends Migration
{
    public function up()
    {
        if (Schema::hasTable('users')) {
            if (config('database.default') === 'pgsql') {
                DB::statement('ALTER TABLE users ALTER COLUMN delete_request DROP NOT NULL;');
            } else {
                DB::statement('ALTER TABLE users MODIFY COLUMN delete_request INT NULL;');
            }
        }
    }

    public function down()
    {
        // No rollback required for nullability in this setup
    }
}
