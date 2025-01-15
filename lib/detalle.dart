import 'package:flutter/material.dart';

class detalleApp extends StatefulWidget {
  const detalleApp({super.key});

  @override
  State<detalleApp> createState() => _detalleAppState();
}

class _detalleAppState extends State<detalleApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          "Estoy en la página de detalle",
        ),
      ),
    );
  }
}