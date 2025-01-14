import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 1, 44, 90),
          title: const Text(
            "Game Of Thrones",
            style: TextStyle(
              color: CupertinoColors.white
            ),
            ),
        ),  
      ),
    );
  }
}

