<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblGalleryTable extends Migration
{
    public function up()
    {
        if (!Schema::hasTable('tbl_gallery')) {
            Schema::create('tbl_gallery', function (Blueprint $table) {
                $table->bigIncrements('id');
                $table->integer('cat_id')->nullable();
                $table->string('video_title')->nullable();
                $table->string('video_url')->nullable();
                $table->string('video_id')->nullable();
                $table->string('video_thumbnail')->nullable();
                $table->string('video_duration')->nullable();
                $table->text('video_description')->nullable();
                $table->string('video_type')->nullable();
                $table->integer('video_status')->default(1);
                $table->string('size')->nullable();
                $table->integer('total_views')->default(0);
                $table->timestamp('date_time')->useCurrent();
            });
        } else {
            Schema::table('tbl_gallery', function (Blueprint $table) {
                if (!Schema::hasColumn('tbl_gallery', 'date_time')) {
                    $table->timestamp('date_time')->useCurrent();
                }
            });
        }
    }

    public function down()
    {
        Schema::dropIfExists('tbl_gallery');
    }
}
