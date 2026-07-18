<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SettingsSeeder extends Seeder
{
    /**
     * Seed the settings table with default values.
     * This only inserts if the table is empty.
     *
     * @return void
     */
    public function run()
    {
        if (DB::table('settings')->count() === 0) {
            DB::table('settings')->insert([
                'logo'          => 'default_logo.png',
                'favicon'       => 'default_favicon.ico',
                'welcome_txt'   => 'Quick Quiz',
                'coming_soon'   => 0,
                'comingsoon_enabled_ip' => null,
                'created_at'    => now(),
                'updated_at'    => now(),
            ]);
        }
    }
}
