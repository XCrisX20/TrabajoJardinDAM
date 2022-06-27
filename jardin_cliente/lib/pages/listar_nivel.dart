
import 'package:flutter/material.dart';
import 'package:jardin_cliente/pages/listado_educadores.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'listado_alumnos.dart';

class ListarNivel extends StatefulWidget {
  final int codigo;
  final String nivel;
  
  ListarNivel({
    this.codigo = 0,
    this.nivel = '',
    Key? key}) : super(key: key);

  @override
  State<ListarNivel> createState() => _ListarNivelState();
  
}

class _ListarNivelState extends State<ListarNivel> {
  int _currentIndex = 0;
  final verdeClaro = Color(0xFF89DA59);
  final naranjo = Color(0xFFFF420E);
  int codigo=0;
  String nivel='';
 

  @override
    void initState() {
    super.initState();
    codigo = widget.codigo;
    nivel = widget.nivel.toString();
    
  }
  List<dynamic> paginas = [
    {"pagina":ListadoAlumnos(nivel:nivel,codigo:codigo,), 'texto': 'Alumnos', 'icono': MdiIcons.humanChild, 'color':0xFF89DA59},
    {'pagina': ListadoEducadores(), 'texto': 'Educadores', 'icono': MdiIcons.human, 'color':0xFF89DA59},
 
    ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('nivel: ' + widget.nivel),
        backgroundColor: verdeClaro,
      ),
      body: paginas[_currentIndex]['pagina'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: paginas.map((p) {
          return BottomNavigationBarItem(
            label: p['texto'],
            icon: Icon(p['icono']),
            backgroundColor: Color(p['color']),
          );
        }).toList(),
       
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}