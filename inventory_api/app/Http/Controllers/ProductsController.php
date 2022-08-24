<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\Product;
use Carbon\Carbon;
use Log;

class ProductsController extends Controller
{
    public function index()
    {
        return Product::all();
    }

    public function update(Request $request, $id)
    {
      

        $product = Product::find($id);
        $product->name =  $request->get('name');
        $product->desciption = $request->get('desciption');
        $product->exp_date = $product->exp_date;
        $product->quantity = $request->get('quantity');
        $product->image_url = $product->image_url;
        $product->price = $request->get('price');
        $product->save();

        
    }


    public function store(Request $request)
    {
        return Product::create($request->all());
    }

    public function expMonth()
{

    $currentDateTime = Carbon::now()->toDateString();
log::info($currentDateTime);
        $newDateTime = Carbon::now()->addMonth()->toDateString();

        log::info($newDateTime);
return Product::whereBetween('exp_date',[$currentDateTime,$newDateTime])->get();


// $start_date = Carbon::parse($request->start_date)
// ->toDateString();
// $end_date = Carbon::parse($request->end_date)
// ->toDateString();
// return Flight::whereBetween('date',[$start_date,$end_date])->get();
// if (is_null($product)) {
// return $this->sendError('Product not found.');
// }
// return response()->json([
// "success" => true,
// "message" => "Product retrieved successfully.",
// "data" => $pro
// ]);
// }
}


public function expThreeMonth()
{

    $currentDateTime = Carbon::now()->addMonth()->toDateString();
log::info($currentDateTime);
        $newDateTime = Carbon::now()->addMonths(3)->toDateString();

        log::info($newDateTime);
return Product::whereBetween('exp_date',[$currentDateTime,$newDateTime])->get();
}

public function expired()
{

    $currentDateTime = Carbon::now()->toDateString();
log::info($currentDateTime);
        $newDateTime = Carbon::now()->subMonths(12)->toDateString();

        log::info($newDateTime);
return Product::whereBetween('exp_date',[$newDateTime,$currentDateTime])->get();
}

public function expSixMonth()
{

    $currentDateTime = Carbon::now()->addMonths(3)->toDateString();
log::info($currentDateTime);
        $newDateTime = Carbon::now()->addMonths(6)->toDateString();

        log::info($newDateTime);
return Product::whereBetween('exp_date',[$currentDateTime,$newDateTime])->get();
}


public function expYear()
{

    $currentDateTime = Carbon::now()->addMonths(6)->toDateString();
log::info($currentDateTime);
        $newDateTime = Carbon::now()->addMonths(12)->toDateString();

        log::info($newDateTime);
return Product::whereBetween('exp_date',[$currentDateTime,$newDateTime])->get();
}


public function search(Request $request)
{
    //

    $start_date = Carbon::parse($request->start_date)
                        ->toDateString();
    $end_date = Carbon::parse($request->end_date)
                        ->toDateString();

    return Products::whereBetween('exp_date',[$start_date,$end_date])->get();
    
}

}