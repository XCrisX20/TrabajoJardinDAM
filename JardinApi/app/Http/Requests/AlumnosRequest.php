<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AlumnosRequest extends FormRequest
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
            'rut' => 'required|numeric|min:9|max:9|unique:alumnos,rut',
            'nombre' => 'required|alpha',
            'nombre_nivel' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'rut.required' => 'Indique rut del Alumno',
            'rut.min' => 'El Rut debe tener un largo de 9',
            'rut.max' => 'El Rut debe tener un largo de 9',
            'rut.unique' => 'El rut ya existe',
            'nombre.required' => 'Indique nombre del Alumno',
            'nombre.alpha' => 'El nombre no puede contener caracteres que no sean letras',
            'nombre_nivel.required' => 'Indique nivel del alumno',
        ];
    }


}
