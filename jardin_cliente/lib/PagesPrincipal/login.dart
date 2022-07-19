import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jardin_cliente/pages/principal_page.dart';
import 'package:jardin_cliente/provider/GoogleService.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        title: Text('Hola Usuario')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              child: ElevatedButton(
                  onPressed: user != null
                      ? null
                      : () async {
                          await GoogleServicio().signInWithGoogle();
                          MaterialPageRoute route = MaterialPageRoute(
                            builder: (context) => PrincipalPage(),
                          );
                          setState(() {});
                          Navigator.pushReplacement(context, route);
                        },
                  child:Row(
                    children: [
                      Icon(MdiIcons.google),
                      Text("           Iniciar Sesion con google",style: TextStyle(fontSize: 20),)
                      
                    ],
                  )
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
