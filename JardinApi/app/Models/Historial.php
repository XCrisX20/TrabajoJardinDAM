<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Historial extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'historial';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = false;

    public function eventos(){
        return $this->hasMany->eventos;
    }
    public function alumnos(){
        return $this->belongsTo->alumnos;
    }
}

