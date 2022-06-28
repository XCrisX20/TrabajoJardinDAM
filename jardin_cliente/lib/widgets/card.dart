import 'package:flutter/material.dart';

import '../pages/listado_alumnos.dart';

class CardWidgets extends StatelessWidget {
  final String texto;
  final String imagen;
  
  const CardWidgets(
      {this.texto = '',
      this.imagen =
          'http://pm1.narvii.com/7119/b0abdf491cffde4bdf95850956c1b15a5591a4b5r1-712-707v2_uhq.jpg',
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          margin: EdgeInsets.all(15),
          elevation: 10,
          color:  Color(0xFFFFE9CE),
          // Dentro de esta propiedad usamos ClipRRect
          child: ClipRRect(
            // Los bordes del contenido del card se cortan usando BorderRadius
            borderRadius: BorderRadius.circular(30),

            // EL widget hijo que será recortado segun la propiedad anterior
            child: Column(
              children: <Widget>[
                // Usamos el widget Image para mostrar una imagen
                Image(
                  height: 200,
                  width: double.infinity,
                  // Como queremos traer una imagen desde un url usamos NetworkImage
                  image: NetworkImage(imagen),
                ),

                // Usamos Container para el contenedor de la descripción
                Container(
                  decoration: new BoxDecoration(color: Color(0xFFFFE9CE)),
                  padding: EdgeInsets.all(10),
                  child: Text(texto,style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          )
    );
  }
}
