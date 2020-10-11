import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_promedio/src/models/materias_model.dart';
import 'package:mi_promedio/src/pages/detalles_materia.dart';
import 'package:mi_promedio/src/bloc/materia_controller.dart';

class ListaMaterias extends StatefulWidget {
  @override
  _ListaMateriasState createState() => _ListaMateriasState();
}

class _ListaMateriasState extends State<ListaMaterias> {
  final controllerNombreMateriaText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de materias'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _agregarMateria(context);
              })
        ],
      ),
      body: _construirBody(context),
    );
  }

  Widget _construirBody(BuildContext context) {
    final double _sizeWidth = MediaQuery.of(context).size.width;
    final double _sizeHeight = MediaQuery.of(context).size.height;
    final double _diagonalSize =
        sqrt((_sizeHeight * _sizeHeight) + (_sizeWidth * _sizeWidth));
    return Container(
      child: Column(
        children: [
          Expanded(
            child: GetBuilder(
                init: MateriaController(),
                builder: (snapshot) {
                  return FutureBuilder<List<MateriasModel>>(
                      future: snapshot.consultarMaterias(),
                      builder: (context, snapshot) {
                        return (snapshot.data == null)
                            ? Center(child: Text('No hay datos'))
                            : ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: (snapshot.data[index].definitiva ==
                                            null)
                                        ? Text('0',
                                            style: TextStyle(
                                                fontSize: _diagonalSize * 0.03))
                                        : Text(
                                            snapshot.data[index].definitiva
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: _diagonalSize * 0.03),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                    title: Text(
                                      snapshot.data[index].nombreMateria,
                                      style: TextStyle(
                                          fontSize: _diagonalSize * 0.03),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    trailing: Icon(
                                      Icons.chevron_right,
                                      size: _diagonalSize * 0.03,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => DetallesMateria(
                                            nombreAsignatura: snapshot
                                                .data[index].nombreMateria,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                      },);
                },),
          ),
          Divider(),
          Container(
            width: _sizeWidth,
            height: _sizeHeight * 0.3,
            // height: _sizeHeight * 0.5,
            // color: Colors.red,
            child: Column(
              children: [
                Text(
                  '5.0',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: _diagonalSize * 0.15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Que pro',
                  style: TextStyle(fontSize: _diagonalSize * 0.04),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _agregarMateria(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Agregar materia'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                // controller: controllerNombreText,
                //autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: 'Nombre de la materia',
                  // labelText: 'Nombre de materia',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                final nuevaMateria = MateriasModel(
                  nombreMateria: 'Cálculo diferencial',
                );
                MateriaController.guardarMateria(nuevaMateria);
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
