<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddUserquizToSettingsTable extends Migration
{
    public function up()
    {
        if (Schema::hasTable('settings')) {
            Schema::table('settings', function (Blueprint $table) {
                if (!Schema::hasColumn('settings', 'userquiz')) {
                    $table->boolean('userquiz')->default(0)->after('welcome_txt');
                }
            });
        }
    }

    public function down()
    {
        if (Schema::hasTable('settings')) {
            Schema::table('settings', function (Blueprint $table) {
                $table->dropColumn('userquiz');
            });
        }
    }
}
