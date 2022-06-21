import 'dart:convert';

import 'package:http/http.dart' as http;

class AlumnosProvider {
  final String apiUrl = 'http://10.0.0.2:8000/api';

  Future<List<dynamic>> getAlumnos() async {
    var url = Uri.parse("$apiUrl/alumnos");
    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }
}
