import 'package:flutter/material.dart';

class ModificarAlumno extends StatefulWidget {
  final String rut;
  final String nombre;
  final String fechaNacimiento;
  final String foto;
  final String sexo;
  final int codigo;
  ModificarAlumno(
      {this.rut = '',
      this.nombre = '',
      this.fechaNacimiento = '',
      this.foto = '',
      this.sexo = '',
      this.codigo = 0,
      Key? key})
      : super(key: key);

  @override
  State<ModificarAlumno> createState() => _ModificarAlumnoState();
}

class _ModificarAlumnoState extends State<ModificarAlumno> {
  final verdeClaro = Color(0xFF89DA59);
  //formulario
  final formKey = GlobalKey<FormState>();
  TextEditingController rutCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  String nomReg = r"/^[a-zA-Z'-]+$";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Modificar Alumno"),
          elevation: 0,
          backgroundColor: verdeClaro,
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                campoRut(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ),
                  child: Text(
                    "Nombre Anterior: " + widget.nombre,
                    style: TextStyle(color: Colors.grey),
                    ),
                ),
                campoNombre(),
              ],
            ),
          ),
        ));
  }

  TextFormField campoRut() {
    return TextFormField(
      enabled: false,
      controller: rutCtrl,
      decoration: InputDecoration(labelText: 'Rut: ' + widget.rut),
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique su Rut';
        }
        return null;
      },
    );
  }

  TextFormField campoNombre() {
    return TextFormField(
      controller: nombreCtrl,
      decoration: InputDecoration(labelText: 'Nombre:'),
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique su primer nombre';
        }
        if (!RegExp(nomReg).hasMatch(valor)) {
          return "Formato de nombre no Valido";
        }
        return null;
      },
    );
  }
}
