import 'package:flutter/material.dart';

class AgregarHistorialForm extends StatefulWidget {
  const AgregarHistorialForm({Key? key}) : super(key: key);

  @override
  State<AgregarHistorialForm> createState() => _AgregarHistorialFormState();
}

class _AgregarHistorialFormState extends State<AgregarHistorialForm> {
  TextEditingController DescCtrl = TextEditingController();
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("accidente"), value: "accidente"),
      DropdownMenuItem(child: Text("agresion"), value: "agresion"),
      DropdownMenuItem(child: Text("bullying"), value: "bullying"),
      DropdownMenuItem(child: Text("retiro"), value: "retiro"),
      DropdownMenuItem(child: Text("suspension"), value: "suspension"),
      DropdownMenuItem(child: Text("mal comportamiento"), value: "mal comportamiento"),
      DropdownMenuItem(child: Text("buen comportamiento"), value: "buen comportamiento"),
      DropdownMenuItem(child: Text("sin respuestas"), value: "sin respuestas"),
    ];

    return menuItems;
  }

  String selectedValue = "accidente";

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Historial de '),
      ),
      body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: ListView(
              children: [
                TextFormField(
                  controller: DescCtrl,
                  decoration: InputDecoration(
                    labelText: 'Descripcion',
                  ),
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Indique La Descripcion';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                Container(
                  child: Text(
                    'tipo evento',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                DropdownButton(
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: dropdownItems),
                Container(
                  child:
                  ElevatedButton(
                    child: Text('Agregar Historial'),
                    onPressed: (){},
                  )
                 ),
              ],
              
            
            ),
          )),
          
    );
  }
}
