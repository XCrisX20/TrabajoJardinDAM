import 'package:flutter/material.dart';
import 'package:jardin_cliente/provider/nivel_provider.dart';
import 'package:jardin_cliente/widgets/card.dart';

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  final verdeClaro = Color(0xFF89DA59);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jardin Infantil'),
        leading: Icon(Icons.child_care),
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
                separatorBuilder: (_, __) => Divider(),
                itemCount: snap.data.length,
                itemBuilder: (context, index) {
                  var nvl = snap.data[index];
                  return CardWidgets(texto: nvl['nombre_nivel'].toString(),);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
