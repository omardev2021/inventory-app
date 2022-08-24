<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->date('exp_date')->nullable();
            $table->unsignedBigInteger('category_id');
            $table->foreign('category_id')->on('categories')->references('id')
            ->onDelete('CASCADE')
            ->onUpdate('CASCADE');
            $table->string('quantity')->nullable();
            $table->string('image_url')->nullable();
            $table->string('desciption')->nullable();
            $table->string('price')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.Z
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
