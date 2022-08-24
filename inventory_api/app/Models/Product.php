<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'exp_date',
        'category_id',
        'desciption',
        'quantity',
        'image_url',
        'price'

    ];




    public function category()
  {
    return $this->belongsTo(Category::class);
  }
}
