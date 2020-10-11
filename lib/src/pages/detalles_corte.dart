import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mi_promedio/src/models/actividad_model.dart';

class DetalleCorte extends StatefulWidget {
  @override
  _DetalleCorteState createState() => _DetalleCorteState();
}

class _DetalleCorteState extends State<DetalleCorte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('# Corte'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _agregarActividad(context);
              })
        ],
      ),
      body: _construirBody(),
    );
  }

  Widget _construirBody() {
    final double _sizeWidth = MediaQuery.of(context).size.width;
    final double _sizeHeight = MediaQuery.of(context).size.height;
    final double _diagonalSize =
        sqrt((_sizeHeight * _sizeHeight) + (_sizeWidth * _sizeWidth));
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          ListView(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    //Container(margin: EdgeInsets.only(top: _sizeHeight * 0.63)),
                    Container(
                      // margin: EdgeInsets.only(top: _sizeHeight * 0.54),
                      margin: EdgeInsets.only(top: _sizeHeight * 0.6),
                      // color: Colors.red,
                      width: _sizeWidth,
                      height: _sizeHeight * 0.3,
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
              ),
            ],
          ),
          Container(
            // color: Colors.blue,
            height: _sizeHeight * 0.55,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            // controller: controllerNombreText,
                            //autofocus: true,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              hintText: 'Nombre de la actividad',
                              // labelText: 'Nombre de materia',
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        SizedBox(
                          width: 50,
                          child: TextField(
                            // controller: controllerNombreText,
                            //autofocus: true,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              hintText: '%',
                              // labelText: 'Nombre de materia',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _agregarActividad(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Agregar actividad'),
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
                  hintText: 'Nombre de la actividad',
                  // labelText: 'Nombre de materia',
                ),
              ),
              TextField(
                // controller: controllerNombreText,
                //autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: '%',
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
                final nuevaActividad = ActividadModel(
                  nombreActividad: 'Taller microbiana',
                );
                //ActividadController.nuevaActividad(nuevaMateria);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
