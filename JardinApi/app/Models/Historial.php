<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Historial extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'historial';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = false;
}
