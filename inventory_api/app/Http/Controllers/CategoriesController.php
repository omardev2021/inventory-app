<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoriesController extends Controller
{
    //

    public function index()
    {
        return Category::With('products')->get();
    }


    public function store(Request $request)
    {
        return Category::create($request->all());
    }

    public function update(Request $request, $id)
    {
    
        $cat = Category::find($id);
        $cat->name =  $request->get('name');
    
        $cat->save();
    }


    public function delete(Request $request,$id)
    {
        $cat = Category::find($id);
        return $cat->delete();

    }
}
