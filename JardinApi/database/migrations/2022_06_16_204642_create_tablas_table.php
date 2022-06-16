<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('alumnos', function (Blueprint $table) {
            $table->string('rut')->primary();
            $table->string('nombre');
            $table->date('fechaNacimiento');
            $table->binary('foto');  
            $table->string('nombre_nivel');
            $table->softDeletes();     
        });

        Schema::create('eventos', function (Blueprint $table) {
            $table->increments('cod_evento');
            $table->string('descripcion');
            $table->string('tipo_evento');
            $table->date('fecha');  
            $table->time('hora');     
            $table->softDeletes();   
        });

        Schema::create('educadores', function (Blueprint $table) {
            $table->string('rut')->primary();
            $table->string('nombre');
            $table->date('fechaNacimiento');
            $table->string('telefono');    
            $table->string('email');
            $table->string('nombre_nivel');
            $table->softDeletes();


        });

        Schema::create('nivel', function (Blueprint $table) {
            $table->string('nombre_nivel')->primary(); 
            $table->softDeletes();        
        });

        Schema::create('historial', function (Blueprint $table) {
            $table->integer('cod_evento')->unsigned()->nullable(); 
            $table->string('rut_alumno'); 
            $table->softDeletes();        
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('alumnos');
        Schema::dropIfExists('educadores');
        Schema::dropIfExists('historial');
        Schema::dropIfExists('eventos');
        Schema::dropIfExists('nivel');
    }
};
