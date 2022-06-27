import 'package:flutter/material.dart';
import 'package:jardin_cliente/pages/gestion_niveles.dart';
import 'package:jardin_cliente/pages/listado_alumnos.dart';
import 'package:jardin_cliente/pages/listar_nivel.dart';
import 'package:jardin_cliente/provider/nivel_provider.dart';
import 'package:jardin_cliente/widgets/card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  final verdeClaro = Color(0xFF89DA59);
  final naranjo = Color(0xFFFF420E);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: naranjo,
      appBar: AppBar(
        title: Text('Jardin Arbolitos'),
        leading: IconButton(
          icon: Icon(MdiIcons.cog),
          onPressed: () {
            MaterialPageRoute route =
                new MaterialPageRoute(builder: (context) => GestionNiveles());
            Navigator.push(context, route);
          },
        ),
        backgroundColor: verdeClaro,
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Expanded(
          child: FutureBuilder(
            future: NivelProvider().getNiveles(),
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
                  var nvl = snap.data[index];
                  return ElevatedButton(
                      child: CardWidgets(texto: nvl['nombre_nivel'].toString()),
                      onPressed: () {
                        MaterialPageRoute route = new MaterialPageRoute(
                            builder: (context) => ListarNivel(
                                  nivel: nvl['nombre_nivel'],
                                  codigo: nvl['cod_nivel'],
                                ));
                        Navigator.push(context, route);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFF420E),
                      ));
                  /*return Container(
                    child: CardWidgets(texto: nvl['nombre_nivel'].toString())
                  );*/
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
