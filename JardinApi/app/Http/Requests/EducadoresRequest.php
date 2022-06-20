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
            'rut'=> 'required|numeric|min:9|max:9|unique:educadores,rut',
            'nombre'=> 'required|alpha',
            'nombre_nivel'=> 'required',
            'email' => 'required|email|unique:',
            'telefono'=> 'required|numeric|min:9|max:9|unique:educadores,telefono',
        ];
    }

    public function messages(){
        return[
            'rut.required'=>'Ingrese un rut valido',
            'nombre.required'=>'indique el nombre del educador',
            'nombre_nivel.required'=>'debe ingresar un nivel',
            'email.required' =>'ingrese un email valido',
            'telefono.required'=>'ingrese un telefono con 9 digitos',
        ];
    }
}
