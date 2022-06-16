<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Eventos extends Model
{
    use HasFactorym, SoftDeletes;
    protected $table = 'eventos';
    protected $primaryKey = 'cod_evento';
    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = false;
}
