import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AlumnosProvider {
  final String apiUrl = 'http://10.0.2.2:8000/api/alumnos';

  //Listar todos los Alumnos
  Future<List<dynamic>> getAlumnos() async {
    var url = Uri.parse(apiUrl);
    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<List<dynamic>> getAlumnosXNivel(int nivel) async {
    var url = Uri.parse('$apiUrl/niv/$nivel');
    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //Listar un alumno por Rut
  Future<LinkedHashMap<String, dynamic>> getAlumno(String rut) async {
    var url = Uri.parse('$apiUrl/$rut');
    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  //Agregar un Alumno
  Future<LinkedHashMap<String, dynamic>> alumnoAgregar(
      String rut,
      String nombre,
      DateTime fechaNacimiento,
      ImagePicker foto,
      int cod_nivel) async {
    var url = Uri.parse('$apiUrl');
    var respuesta = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'rut': rut,
          'nombre': nombre,
          'fechaNacimiento': fechaNacimiento,
          'foto': foto,
          'cod_nivel': cod_nivel
        }));
    return json.decode(respuesta.body);
  }

  //Actualizar un Alumno
  Future<LinkedHashMap<String, dynamic>> alumnoEditar(String rut, String nombre,
      DateTime fechaNacimiento, ImagePicker foto, int cod_nivel) async {
    var url = Uri.parse('$apiUrl/$rut');
    var respuesta = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'nombre': nombre,
          'fechaNacimiento': fechaNacimiento,
          'foto': foto,
          'cod_nivel': cod_nivel
        }));
    return json.decode(respuesta.body);
  }

  //borra un alumno
  Future<bool> alumnoBorrar(String rut) async {
    var url = Uri.parse('$apiUrl/$rut');
    var respuesta = await http.delete(url);
    return respuesta.statusCode == 200;
  }
}
