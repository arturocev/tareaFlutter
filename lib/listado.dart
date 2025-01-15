import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tarea_flutter/personaje.dart';

  void main() 
  {
    runApp(const listadoApp());
  }

class listadoApp extends StatefulWidget {
  const listadoApp({super.key});

  @override
  State<listadoApp> createState() => _listadoAppState();
}

class _listadoAppState extends State<listadoApp> {

  late String texto;

  @override
  void initState()
  {
    texto = "0";
    aniadirAmigos();
    super.initState();
  }

  void aniadirAmigos() async
  {
    final url = Uri.parse("https://anapioficeandfire.com/api/characters/583");
    final response = await http.get(url);
    if (response.statusCode == 200) 
    {
      final json = response.body;
      Personaje personaje = Personaje.fromJson(jsonDecode(json));
      texto = personaje.name;
    }
    else
    {
      texto = "No ha funcionado";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
  return ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 50,
        child: Center(child: Text('$texto')),
      );
    }
  );
}
}

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

