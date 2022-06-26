import 'package:flutter/material.dart';

class ModificarAlumno extends StatefulWidget {
  final String rut;
  final String nombre;
  final DateTime fechaNacimiento;
  final String foto;
  final String sexo;
  final int codigo;
  ModificarAlumno(
      {this.rut = '',
      this.nombre = '',
      DateTime? fechaNacimiento,
      this.foto = '',
      this.sexo = '',
      this.codigo = 0,
      Key? key})
      : this.fechaNacimiento = fechaNacimiento ?? DateTime.now() 
      ,super(key: key);

  @override
  State<ModificarAlumno> createState() => _ModificarAlumnoState();
}

class _ModificarAlumnoState extends State<ModificarAlumno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar Alumno con Rut: "+ widget.rut),
      ),
      body: Column(),
    );
  }
}
