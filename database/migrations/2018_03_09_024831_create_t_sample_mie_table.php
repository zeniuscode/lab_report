<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTSampleMieTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('t_sample_mie', function (Blueprint $table) {
          $table->string('id', 10);
          $table->string('line_id', 3);
          $table->string('dept_id', 3);
          $table->string('mid_product', 20);
          $table->date('sample_date');
          $table->date('input_date');
          $table->time('sample_time');
          $table->time('input_time');
          $table->string('shift', 1);
          $table->enum('approve', ['Y','N','']);
          $table->string('approver', 12);
          $table->date('approve_date');
          $table->time('approve_time');
          $table->string('created_by', 12);
          $table->string('keterangan');
          $table->timestamps();
          $table->primary('id');
          $table->foreign('line_id')->references('id')->on('m_line');
          $table->foreign('dept_id')->references('id')->on('m_department');
          $table->foreign('mid_product')->references('mid')->on('m_variant_product');
      });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('t_sample_mie');
    }
}
