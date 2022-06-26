import 'package:flutter/material.dart';
import 'package:jardin_cliente/pages/agregar_alumno_form.dart';
import 'package:jardin_cliente/pages/ver_alumno.dart';
import 'package:jardin_cliente/provider/alumnos_provider.dart';

class ListadoAlumnos extends StatefulWidget {
  final String nivel;
  final int codigo;
  ListadoAlumnos({this.nivel = '', this.codigo = 0, Key? key})
      : super(key: key);

  @override
  State<ListadoAlumnos> createState() => _ListadoAlumnosState();
}

class _ListadoAlumnosState extends State<ListadoAlumnos> {
  final verdeClaro = Color(0xFF89DA59);
  final naranjo = Color(0xFFFF420E);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: verdeClaro,
        title: Text("Alumnos " + widget.nivel),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Expanded(
          child: FutureBuilder(
            future: AlumnosProvider().getAlumnosXNivel(widget.codigo),
            builder: (context, AsyncSnapshot snap) {
              if (!snap.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (_, __) => Divider(),
                itemCount: snap.data.length,
                itemBuilder: (context, index) {
                  var alumno = snap.data[index];
                  return ListTile(
                    title: Text(alumno['nombre'].toString()),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Ver_Alumnos(
                                  codigo: widget.codigo,
                                  rut: alumno['rut'].toString(),
                                )),
                      ).then((value) {
                        setState(() {});
                      });
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FormAgregarAlumnosPage(
                      codigo: widget.codigo,
                      nivel: widget.nivel.toString(),
                    )),
          ).then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
        backgroundColor: verdeClaro,
      ),
    );
  }
}
