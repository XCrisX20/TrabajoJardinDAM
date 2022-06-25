import 'package:flutter/material.dart';
import 'package:jardin_cliente/provider/alumnos_provider.dart';

class Ver_Alumnos extends StatefulWidget {
  final int codigo;
  final String rut;

  const Ver_Alumnos({this.codigo = 0, this.rut = '', Key? key})
      : super(key: key);

  @override
  State<Ver_Alumnos> createState() => _Ver_AlumnosState();
}

String nombre = '';

class _Ver_AlumnosState extends State<Ver_Alumnos> {
  final verdeClaro = Color(0xFF89DA59);
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: verdeClaro,
        title: Text("Informacion del alumno"),
      ),
      body: FutureBuilder(
        future: AlumnosProvider().getAlumno(widget.rut),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var Data = snapshot.data;
          return Container(
              child: Column(
            children: [
              Row(
                children: [Text(Data['rut'])],
              ),
              Row(
                children: [Text(Data['nombre'])],
              ),
              Row(
                children: [Text(Data['fechaNacimiento'].toString())],
              ),
            ],
          ));
        },
      ),
    );
  }
}
