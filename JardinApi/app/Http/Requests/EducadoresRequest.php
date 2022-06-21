<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EducadoresRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'rut'=> 'required|numeric|digits:9|unique:educadores,rut',
            'nombre'=> 'required|alpha',
            'nombre_nivel'=> 'required',
            'email' => 'required|email|unique:',
            'telefono'=> 'required|numeric|digits:9|unique:educadores,telefono',
        ];
    }

    public function messages(){
        return[
            'rut.required'=>'Ingrese un rut valido',
            'rut.numeric' => 'El rut debe ser numerico',
            'rut.digits' => 'El rut no debe ser mas largo que 9',
            'rut.unique' => 'El rut ya existe',
            'nombre.required'=>'indique el nombre del educador',
            'nombre.alpha' => 'El nombre solo debe contener letras',
            'email.required' =>'ingrese un email',
            'email.email' => 'El email no tiene un formato correcto',
            'email.unique' => 'el email ya existe',
            'nombre_nivel.required'=>'debe ingresar un nivel',
            'telefono.required'=>'ingrese un telefono',
            'telefono.numeric' => 'El telefono solo debe contener numeros',
            'telefono.digits' => 'El telefono debe contener 9 digitos',
            'telefono.unique' => 'El telefono ya existe'
        ];
    }
}
