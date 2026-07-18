<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

/*
|--------------------------------------------------------------------------
| Video Gallery API (public, no auth required)
|--------------------------------------------------------------------------
*/
Route::get('/videolist', 'VideoApiController@index');       // list + pagination + search
Route::get('/videolist/{id}', 'VideoApiController@show');   // single video detail
Route::get('/category_list', 'VideoApiController@categories'); // distinct categories
