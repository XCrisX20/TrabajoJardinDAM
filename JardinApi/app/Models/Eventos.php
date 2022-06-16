<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Eventos extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'eventos';
    protected $primaryKey = 'cod_evento';
    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = false;

    function historial() {
        return $this->belongsTo(Historial::class);
    
    }
}

