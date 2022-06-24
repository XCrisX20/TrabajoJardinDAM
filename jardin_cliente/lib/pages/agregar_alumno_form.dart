import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FormAgregarAlumnosPage extends StatefulWidget {
  FormAgregarAlumnosPage({Key? key}) : super(key: key);

  @override
  State<FormAgregarAlumnosPage> createState() => _FormAgregarAlumnosPageState();
}

class _FormAgregarAlumnosPageState extends State<FormAgregarAlumnosPage> {
  final formKey = GlobalKey<FormState>();
  DateTime fechaSeleccionada = DateTime.now();
  var ffecha = DateFormat('dd-MM-yyyy');
  String jornadaSeleccionada = 'd';
  bool estudiaGratuidad = true;
  String emailRegex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final verdeClaro = Color(0xFF89DA59);
  final naranjo =Color(0xFFFF420E);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Form'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView(
            children: [
              campoNombres(),
              campoApellidos(),
              campoEmail(),
              campoFechaNacimiento(),
              campoJornada(),
              campoGratuidad(),
              botonMatricular(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField campoNombres() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nombres',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique su nombre';
        }
        return null;
      },
    );
  }

  TextFormField campoApellidos() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Apellidos',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique sus apellidos';
        }
        return null;
      },
    );
  }

  TextFormField campoEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique su email';
        }
        if (!RegExp(emailRegex).hasMatch(valor)) {
          return 'Formato de email no válido';
        }
        return null;
      },
    );
  }

  Row campoFechaNacimiento() {
    return Row(
      children: [
        Text('Fecha de nacimiento:', style: TextStyle(fontSize: 16)),
        Text(ffecha.format(fechaSeleccionada), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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

  Column campoJornada() {
    return Column(
      children: [
        RadioListTile<String>(
          groupValue: jornadaSeleccionada,
          title: Text('Jornada Diurna'),
          value: 'd',
          onChanged: (jornada) {
            setState(() {
              jornadaSeleccionada = jornada!;
            });
          },
        ),
        RadioListTile<String>(
          groupValue: jornadaSeleccionada,
          title: Text('Jornada Vespertina'),
          value: 'v',
          onChanged: (jornada) {
            setState(() {
              jornadaSeleccionada = jornada!;
            });
          },
        ),
      ],
    );
  }

  SwitchListTile campoGratuidad() {
    return SwitchListTile(
      title: Text('Estudia con Gratuidad'),
      value: estudiaGratuidad,
      onChanged: ((gratuidad) {
        setState(() {
          estudiaGratuidad = gratuidad;
        });
      }),
    );
  }

  Container botonMatricular() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Matricular'),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            //form ok
            print('FORMULARIO OK');
          }
          
        },
      ),
    );
  }
}