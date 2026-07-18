<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class AlterTblGalleryColumnsToText extends Migration
{
    public function up()
    {
        if (Schema::hasTable('tbl_gallery')) {
            if (config('database.default') === 'pgsql') {
                DB::statement('ALTER TABLE tbl_gallery ALTER COLUMN video_url TYPE text;');
                DB::statement('ALTER TABLE tbl_gallery ALTER COLUMN video_thumbnail TYPE text;');
                DB::statement('ALTER TABLE tbl_gallery ALTER COLUMN video_title TYPE text;');
            } else {
                DB::statement('ALTER TABLE tbl_gallery MODIFY COLUMN video_url text;');
                DB::statement('ALTER TABLE tbl_gallery MODIFY COLUMN video_thumbnail text;');
                DB::statement('ALTER TABLE tbl_gallery MODIFY COLUMN video_title text;');
            }
        }
    }

    public function down()
    {
        // No down migration required in this context
    }
}
