import 'package:flutter/material.dart';
import 'package:mi_promedio/src/pages/lista_materias.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: Container(
            child: ListaMaterias(),
          ),
        ),
      ),
    );
  }
}
