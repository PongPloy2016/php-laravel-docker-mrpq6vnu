<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDateTimeToTblGalleryTable extends Migration
{
    public function up()
    {
        if (Schema::hasTable('tbl_gallery')) {
            Schema::table('tbl_gallery', function (Blueprint $table) {
                if (!Schema::hasColumn('tbl_gallery', 'date_time')) {
                    $table->timestamp('date_time')->useCurrent();
                }
            });
        }
    }

    public function down()
    {
        if (Schema::hasTable('tbl_gallery')) {
            Schema::table('tbl_gallery', function (Blueprint $table) {
                $table->dropColumn('date_time');
            });
        }
    }
}
