import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jardin Infantil'),
        leading: Icon(Icons.child_care),
      ),
      body: Center(child: Text('Jardin Payasito', style: TextStyle(fontSize: 30),),)
    );
  }
}