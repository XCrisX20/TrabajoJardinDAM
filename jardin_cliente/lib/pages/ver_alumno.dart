import 'package:flutter/material.dart';

class Ver_Alumnos extends StatefulWidget {
  final int codigo;
  final String rut;
  const Ver_Alumnos({this.codigo = 0, this.rut = '', Key? key})
      : super(key: key);

  @override
  State<Ver_Alumnos> createState() => _Ver_AlumnosState();
}

class _Ver_AlumnosState extends State<Ver_Alumnos> {
  final verdeClaro = Color(0xFF89DA59);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: verdeClaro,
        title: Text("Informacion del alumno"),
      ),
      body: Text(widget.rut),
    );
  }
}
