import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          CardWidgets(texto: 'Play Group'),
          CardWidgets(texto: 'Medio Menor'),
          CardWidgets(texto: 'Medio Mayor'),
        ],
      )
    );
  }
}