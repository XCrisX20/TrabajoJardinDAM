import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as ImageProcess;
import 'dart:convert';
import 'package:jardin_cliente/provider/alumnos_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Ver_Alumnos extends StatefulWidget {
  final int codigo;
  final String rut;
  final String nivel;
  const Ver_Alumnos({this.codigo = 0, this.rut = '', this.nivel = '', Key? key})
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
          var alumno = snapshot.data;
          var sexo;
          if (alumno['sexo'] == 'M') {
            sexo = "Masculino";
          } else if (alumno['sexo'] == 'F') {
            sexo = "Femenino";
          } else {
            sexo = "Indeterminado";
          }
          var imagen;
          if (alumno['foto'] != null) {
            Uint8List bytes = base64.decode(alumno['foto']);
            imagen = Image.memory(bytes);
          } else {
            imagen = Container(child: Text("Alumno sin Imagen"));
          }

          return Column(
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        alignment: Alignment.center,
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: imagen,
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Rut: " + alumno['rut'],
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Nombre: " + alumno['nombre'],
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Fecha Nacimiento: " + alumno['fechaNacimiento'],
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Sexo: " + sexo,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Nivel: " + widget.nivel,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: Text(
                        'Eliminar Alumno',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('Eliminar Alumno'),
                                  content: Text(
                                      '¿Esta seguro de Eliminar este Alumno?'),
                                  actions: [
                                    TextButton.icon(
                                      icon: Icon(MdiIcons.check),
                                      label: Text("OK"),
                                      onPressed: () {
                                        AlumnosProvider()
                                            .alumnoBorrar(widget.rut)
                                            .then((borrado) {
                                          if (borrado) {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text("Informacion"),
                                                content: Text("Alumno Eliminado!"),
                                                actions: [
                                                  TextButton.icon(
                                                    icon: Icon(MdiIcons.check),
                                                    label: Text('OK'),
                                                    onPressed: (){
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                ],
                                            ));
                                          }else{
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text("Informacion"),
                                                content: Text("Alumno no se pudo Eliminar!"),
                                                actions: [
                                                  TextButton.icon(
                                                    icon: Icon(MdiIcons.check),
                                                    label: Text('OK'),
                                                    onPressed: (){
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                ],
                                            ));
                                          }
                                        });
                                        Navigator.of(context).pop('OK');
                                      },
                                    ),
                                    TextButton.icon(
                                      icon: Icon(MdiIcons.close),
                                      label: Text("Cancelar"),
                                      onPressed: () {
                                        Navigator.of(context).pop('Cancelar');
                                      },
                                    ),
                                  ],
                        )).then((value) => print(value));
                        setState(() {});
                      },
                    ),
                    ElevatedButton(
                        child: Text('Modificar Datos'),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow,
                        )),
                    ElevatedButton(
                      child: Text(
                        'Ver Historial',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
