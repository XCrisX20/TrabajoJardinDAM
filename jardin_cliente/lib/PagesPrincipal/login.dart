import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IniciarSesion extends StatefulWidget {
  const IniciarSesion({Key? key}) : super(key: key);

  @override
  State<IniciarSesion> createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola Usuario ' + (user == null ? 'entrada' : 'salida')),
        leading: Icon(MdiIcons.humanHandsup),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: user != null
                    ? null
                    : () async {
                        await _googleSignIn.signIn();
                        setState(() {});
                      },
                child: Text("Iniciar Sesion")),
            ElevatedButton(
                onPressed: user == null
                    ? null
                    : () async {
                        await _googleSignIn.signOut();
                        setState(() {});
                      },
                child: Text("Cerrar Sesion")),
          ],
        ),
      ),
    );
  }
}
