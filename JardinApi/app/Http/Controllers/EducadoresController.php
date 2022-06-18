<?php

namespace App\Http\Controllers;

use App\Models\Educadores;
use Illuminate\Http\Request;

class EducadoresController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Educadores::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $educadores = new Educadores();
        $educadores->rut = $request->rut;
        $educadores->nombre = $request->nombre;
        $educadores->fechaNacimiento = $request->fechaNacimiento;
        $educadores->telefono = $request->telefono;
        $educadores->email = $request->email;
        $educadores->nombre_nivel = $request->nombre_nivel;
        $educadores->save();
        return $educadores;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Educadores $educadores
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $educadores = Educadores::where('rut',$request->rut)->first();
        return $educadores;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Educadores  $educadores
     * @return \Illuminate\Http\Response
     */
    public function edit(Educadores $educadores)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Educadores  $educadores
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Educadores $educadores)
    {
        $educadores->nombre = $request->nombre;
        $educadores->fechaNacimiento = $request->fechaNacimiento;
        $educadores->telefono = $request->telefono;
        $educadores->email = $request->email;
        $educadores->nombre_nivel = $request->nombre_nivel;
        $educadores->save();
        return  $educadores;

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Educadores  $educadores
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $educadores = Educadores::where('rut',$request->rut)->first();
        $educadores->delete();
    }
}
