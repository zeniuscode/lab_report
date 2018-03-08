<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMUserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_user', function (Blueprint $table) {
            $table->string('nik', 12);
            $table->integer('group_id')->unsigned();
            $table->string('dept_id', 3);
            $table->string('name', 50);
            $table->string('jabatan', 30);
            $table->string('email', 100)->unique()->nullable();
            $table->string('created_by', 12);
            $table->string('updated_by', 12);
            $table->enum('status', ['Y', 'N']);
            $table->timestamps();
            $table->primary('nik');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_user');
    }
}
