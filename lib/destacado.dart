import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tarea_flutter/personaje.dart';


class destacadoApp extends StatefulWidget {
  const destacadoApp({super.key});

  @override
  State<destacadoApp> createState() => _destacadoAppState();
}


class _destacadoAppState extends State<destacadoApp> {
  String personajeTexto = "";
  int idPersonaje = 2122;
  Random random = new Random();
  late Icon icono = Icon(Icons.timer_off);

  @override
  void initState()
  {
    personajeRandom();
    super.initState();
  }
  
  void personajeRandom() async
  {
    idPersonaje = random.nextInt(2121);
    final url = Uri.parse("https://www.anapioficeandfire.com/api/characters/$idPersonaje");
    final response = await http.get(url);

    if (response.statusCode == 200) 
    {
      final json = response.body;
      Personaje personaje = Personaje.fromJson(jsonDecode(json));
      personajeTexto = "${personaje.name}: ${personaje.gender}";
      if (personaje.gender == "Male") 
      {
        icono = Icon(Icons.male);
      }
      else
      {
        icono = Icon(Icons.female);
      }
    }
    else
    {
      personajeTexto = "Error al cargar el personaje";
    }
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
          padding: EdgeInsets.all(200),
          child: personajeTexto.isEmpty ? 
          CircularProgressIndicator(): 
          Text(
          personajeTexto,
          style: const TextStyle
          ( 
            fontSize: 17.0,
          ),
        ),
        ),
        personajeTexto.isEmpty ?
        CircularProgressIndicator(): icono
        ],
      ),
    );
  }
}

