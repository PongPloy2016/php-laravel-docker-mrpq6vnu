<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    protected $table = 'settings';

    protected $fillable = [
        'logo',
        'favicon',
        'welcome_txt',
        'app_name',
        'w_email',
        'right_setting',
        'element_setting',
        'wel_mail',
        'coming_soon',
        'comingsoon_enabled_ip',
        'currency_code',
        'currency_symbol',
        'userquiz',
        'api_key',
        'paypal_id',
        'paypal_secret',
        'paypal_mode',
        'custom_css',
        'custom_js',
    ];

    protected $casts = [
        'comingsoon_enabled_ip' => 'array',
    ];
}
