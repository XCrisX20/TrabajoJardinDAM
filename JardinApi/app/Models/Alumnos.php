<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Alumnos extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'alumnos';
    protected $primaryKey = 'rut';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = false;

    public function nivel(){
        return $this->belongsTo(Nivel::class);}

}
