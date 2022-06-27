import 'package:flutter/material.dart';
import 'package:jardin_cliente/pages/agregar_nivel.dart';
import 'package:jardin_cliente/provider/nivel_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GestionNiveles extends StatefulWidget {
  GestionNiveles({Key? key}) : super(key: key);

  @override
  State<GestionNiveles> createState() => _GestionNivelesState();
}

class _GestionNivelesState extends State<GestionNiveles> {
  final verdeClaro = Color(0xFF89DA59);
  final naranjo = Color(0xFFFF420E);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion de Niveles"),
        backgroundColor: verdeClaro,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
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
                separatorBuilder: ((context, index) => Divider()),
                itemCount: snap.data.length,
                itemBuilder: (context, index) {
                  var nvl = snap.data[index];
                  return ListTile(
                    title: Text(nvl['nombre_nivel'].toString()),
                    leading:Text(nvl['cod_nivel'].toString()),
                    trailing: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: IconButton(icon: Icon(MdiIcons.trashCan), onPressed: (){
                            
                          }),
                        ),
                        IconButton(icon: Icon(MdiIcons.pencil), onPressed: (){

                        },),
                      ],
                    ),
                  );
                });
          },
        )),
      ),
    floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: verdeClaro,
        onPressed: (){
          MaterialPageRoute route = new MaterialPageRoute(builder: ((context) => AgregarNivel()));
          Navigator.push(context, route).then((value){
            setState(() {});
          });
        },
      ),
    );
  }
}
