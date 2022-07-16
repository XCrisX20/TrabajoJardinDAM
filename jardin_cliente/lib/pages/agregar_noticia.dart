import 'package:flutter/material.dart';


class AgregarNoticia extends StatefulWidget {
  AgregarNoticia({Key? key}) : super(key: key);

  @override
  State<AgregarNoticia> createState() => _AgregarNoticiaState();
}

class _AgregarNoticiaState extends State<AgregarNoticia> {
  //colores del sistema
  final primerColor = Color(0xFFFFBE86);
  final AmarilloColor = Color(0xFFFFE156);
  final rosadoColor = Color(0xFFFFB5C2);
  final incipidoColor = Color(0xFFFFE9CE);
  //formulario
  final formKey = GlobalKey<FormState>();
  String? foto = null;
  TextEditingController nombreCtrl = new TextEditingController();
  String errNombre = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Noticia"),
        backgroundColor: primerColor,
      ),
      body: Form(
        key: formKey,
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Column(
                children: [
                  TextFormField(
                    controller: nombreCtrl,
                    decoration: InputDecoration(
                      labelText: 'Titulo de la Noticia',
                    ),
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'Indique el Titulo';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: nombreCtrl,
                    decoration: InputDecoration(
                      labelText: 'Contenido de la noticia',
                    ),
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'Indique el Titulo';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: nombreCtrl,
                    decoration: InputDecoration(
                      labelText: 'Fecha',
                    ),
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'Indique el Titulo';
                      }
                      return null;
                    },
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      errNombre,
                      style:
                          TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                  
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("Agregar Noticia"),
                      onPressed: () async {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AmarilloColor
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
