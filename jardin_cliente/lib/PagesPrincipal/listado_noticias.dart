import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../provider/noticias_provider.dart';

class Listado_noticias extends StatefulWidget {
  Listado_noticias({Key? key}) : super(key: key);

  @override
  State<Listado_noticias> createState() => _Listado_noticiasState();
}

class _Listado_noticiasState extends State<Listado_noticias> {
  final primerColor = Color(0xFFFFBE86);
  final AmarilloColor = Color(0xFFFFE156);
  final rosadoColor = Color(0xFFFFB5C2);
  final incipidoColor = Color(0xFFFFE9CE);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AmarilloColor,
        title: Text('Noticias'),
        leading: Icon(MdiIcons.newspaper),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirestoreService().noticias(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var noticias = snapshot.data!.docs[index];
                    print(noticias);
                    return ListTile(
                      leading: Icon(MdiIcons.cube),
                      title: Text('${noticias['titulo']}'),
                      subtitle: Text(
                          'contenido: ${noticias['contenido']} fecha:\$${noticias['fecha']}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
