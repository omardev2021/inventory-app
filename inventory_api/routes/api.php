<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoriesController;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\AuthController;
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

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::get('/categories', [CategoriesController::class, 'index']);
Route::post('/categories', [CategoriesController::class, 'store']);
Route::get('/users', [AuthController::class, 'index']);

Route::get('/products', [ProductsController::class, 'index']);
Route::post('/products', [ProductsController::class, 'store']);
Route::get('/products/month', [ProductsController::class, 'expMonth']);
Route::get('/products/three-month', [ProductsController::class, 'expThreeMonth']);
Route::get('/products/six-month', [ProductsController::class, 'expSixMonth']);
Route::get('/products/expired', [ProductsController::class, 'expired']);
Route::get('/products/year', [ProductsController::class, 'expYear']);
Route::put('/products/{id}', [ProductsController::class, 'update']);

Route::put('/update/{id}', [CategoriesController::class, 'update']);
Route::post('/delete/{id}', [CategoriesController::class, 'delete']);
// Route::post('/search', [ProductsController::class, 'search']);


Route::group(['middleware' => ['auth:sanctum']], function () {



});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
