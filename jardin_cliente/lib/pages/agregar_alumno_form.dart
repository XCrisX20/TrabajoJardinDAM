import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jardin_cliente/provider/alumnos_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import

class FormAgregarAlumnosPage extends StatefulWidget {
  final int codigo;
  final String nivel;

  FormAgregarAlumnosPage({this.codigo = 0, this.nivel = '', Key? key})
      : super(key: key);

  @override
  State<FormAgregarAlumnosPage> createState() => _FormAgregarAlumnosPageState();
}

class _FormAgregarAlumnosPageState extends State<FormAgregarAlumnosPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController rutCtrl = TextEditingController();
  TextEditingController namefCtrl = TextEditingController();
  TextEditingController namesCtrl = TextEditingController();
  TextEditingController surnamefCtrl = TextEditingController();
  TextEditingController surnamesCtrl = TextEditingController();
  DateTime fechaSeleccionada = DateTime.now();
  var ffecha = DateFormat('dd-MM-yyyy');
  String jornadaSeleccionada = 'd';
  bool estudiaGratuidad = true;
  String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  String? gender = 'M';
  final verdeClaro = Color(0xFF89DA59);
  final naranjo = Color(0xFFFF420E);
  int group = 1;
  String nombre = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: verdeClaro,
        title: Text('Agregar Alumno a ' + widget.nivel),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView(
            children: [
              CampoRut(),
              campoPrimerNombre(),
              campoSegundoNombre(),
              campoPrimerApellido(),
              campoSegundoApellido(),
              campoSexo(),
              campoFechaNacimiento(),
              campoFoto(),
              botonMatricular(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField CampoRut() {
    return TextFormField(
      controller: rutCtrl,
      decoration: InputDecoration(
        labelText: 'Rut del alumno',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique su Rut';
        }
        return rutCtrl.toString();
      },
    );
  }

  TextFormField campoPrimerNombre() {
    return TextFormField(
      controller: namefCtrl,
      decoration: InputDecoration(
        labelText: 'Primer Nombre',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique su primer nombre';
        }
        return null;
      },
    );
  }

  TextFormField campoSegundoNombre() {
    return TextFormField(
      controller: namesCtrl,
      decoration: InputDecoration(
        labelText: 'Segundo Nombre',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique su segundo nombre';
        }
        return null;
      },
    );
  }

  TextFormField campoPrimerApellido() {
    return TextFormField(
      controller: surnamefCtrl,
      decoration: InputDecoration(
        labelText: 'Primer Apellido',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique su primer apellido';
        }
        return null;
      },
    );
  }

  TextFormField campoSegundoApellido() {
    return TextFormField(
      controller: surnamesCtrl,
      decoration: InputDecoration(
        labelText: 'Segundo Apellido',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique su segundo apellido';
        }
        return null;
      },
    );
  }

  Container campoSexo() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Radio(
                      value: 'M',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      }),
                  Text('Hombre')
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: 'F',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      }),
                  Text('Mujer')
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: 'I',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      }),
                  Text('Otro')
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row campoFechaNacimiento() {
    return Row(
      children: [
        Text('Fecha de nacimiento:', style: TextStyle(fontSize: 16)),
        Text(ffecha.format(fechaSeleccionada),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Spacer(),
        TextButton(
          child: Icon(MdiIcons.calendar),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1920),
              lastDate: DateTime.now(),
              locale: Locale('es', 'ES'),
            ).then((fecha) {
              setState(() {
                // fechaSeleccionada = fecha != null ? fecha : fechaSeleccionada;
                fechaSeleccionada = fecha ?? fechaSeleccionada;
              });
            });
          },
        ),
      ],
    );
  }

  Row campoFoto() {
    return Row(
      children: [
        ElevatedButton.icon( 
          icon: Icon(Icons.camera), 
          label: Text('Seleccione una imagen'),
          onPressed: (){
            //_showSelectionDialog(context);
          },
        
          
          )
      ],
  
    );
  }

  Container botonMatricular() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          child: Text('Matricular'),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: verdeClaro,
          )),
    );
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("¿de donde quieres obtener tu foto?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Galeria"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camara"),
                      onTap: () {
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }
  void _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }
  void _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }
  Widget _setImageView() {
    if (imageFile != null) {
      return Image.file(imageFile, width: 500, height: 500);
    } else {
      return Text("Please select an image");
    }
  }

}



