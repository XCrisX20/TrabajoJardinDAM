import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Login_Principal extends StatelessWidget {
  const Login_Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola Usuario'),
        leading: Icon(MdiIcons.humanHandsup),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: Text("")),
      ),
    );
  }
}
