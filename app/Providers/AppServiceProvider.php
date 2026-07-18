<?php

namespace App\Providers;

use Illuminate\Routing\UrlGenerator;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @param UrlGenerator $url
     * @return void
     */
    public function boot(UrlGenerator $url)
    {
        if (env('APP_ENV') == 'production') {
            $url->forceScheme('https');
        }

        // แชร์ตัวแปร $setting ให้กับทุกวิวอย่างปลอดภัย
        if (\Illuminate\Support\Facades\Schema::hasTable('settings')) {
            try {
                $setting = \App\Setting::first();
                \Illuminate\Support\Facades\View::share('setting', $setting);
            } catch (\Exception $e) {
                // ข้ามหากฐานข้อมูลยังมีปัญหา
            }
        }

        // แชร์ตัวแปร $auth (ผู้ใช้ปัจจุบัน) ให้กับทุกวิว
        \Illuminate\Support\Facades\View::composer('*', function ($view) {
            $view->with('auth', \Illuminate\Support\Facades\Auth::user());
        });
    }
}
