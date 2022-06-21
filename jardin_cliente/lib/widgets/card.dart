import 'package:flutter/material.dart';

class CardWidgets extends StatelessWidget {
  final String texto;
  final String imagen;
  const CardWidgets({this.texto = '', this.imagen = '', Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.amber),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          margin: EdgeInsets.all(15),
          elevation: 10,
          color:Color(0xFF89DA59) ,
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
                    decoration: new BoxDecoration(
                      color:Color(0xFF89DA59)
                    ),
                  padding: EdgeInsets.all(10),
                  child: Text(texto),
                ),
              ],
            ),
          )),
      onPressed: () {
        print("Se preciono");
      },
    );
  }
}
