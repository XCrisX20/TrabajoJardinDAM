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
<<<<<<< HEAD
        appBar: AppBar(
          title: Text('Jardin Infantil'),
          leading: Icon(Icons.child_care),
          backgroundColor: verdeClaro,
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: NivelProvider().getNiveles(),
                builder: (context, AsyncSnapshot snap) {
                  if (!snap.hasData) {
                    return Center(
                      child: CircularProgressIndicator()
                    );
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: snap.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snap.data[index]['nombre']),
                      );
                    },
                  );
                },
              ),
            )
          ],
          /*child: Column(
          children: [
            CardWidgets(texto: 'Play Group',imagen:'https://images.pexels.com/photos/8613366/pexels-photo-8613366.jpeg?cs=srgb&dl=pexels-yan-krukov-8613366.jpg&fm=jpg'),
            CardWidgets(texto: 'Medio Menor',imagen:'https://images.pexels.com/photos/8363119/pexels-photo-8363119.jpeg?cs=srgb&dl=pexels-rodnae-productions-8363119.jpg&fm=jpg'),
            CardWidgets(texto: 'Medio Mayor',imagen: 'https://images.pexels.com/photos/8363102/pexels-photo-8363102.jpeg?cs=srgb&dl=pexels-rodnae-productions-8363102.jpg&fm=jpg'),
          ],
        ),*/
        ));
=======
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
                  return ListTile(
                    title: Text(nvl['nombre_nivel']),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
>>>>>>> 8db6fe99602457894b6707fa9d4036d95f3daa3d
  }
}
