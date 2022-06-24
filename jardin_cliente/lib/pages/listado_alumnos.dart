import 'package:flutter/material.dart';

class ListadoAlumnos extends StatefulWidget {
  final String nivel;
  ListadoAlumnos({this.nivel = '', Key? key}) : super(key: key);

  @override
  State<ListadoAlumnos> createState() => _ListadoAlumnosState();
}

class _ListadoAlumnosState extends State<ListadoAlumnos> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alumnos " + widget.nivel),
      ),
      body: Center(child: Text('Listado de Alumnos')),
    );
  }
}
