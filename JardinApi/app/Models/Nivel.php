<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Nivel extends Model
{
    use HasFactory, SoftDeletes;
    
    protected $table = 'nivel';
    protected $primaryKey = 'nombre_nivel';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = false;


    public function educadores(){
        return $this->hasMany(Educadores::class);
    }
    
    public function alumnos(){
        return $this->hasMany(Alumnos::class);
    }

}
