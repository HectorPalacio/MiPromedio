import 'dart:math';

import 'package:flutter/material.dart';

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
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: _diagonalSize * 0.47)),
                    Divider(),
                    Container(
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
                            '¿Eres Pajayó?',
                            style: TextStyle(fontSize: _diagonalSize * 0.04),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                height: _diagonalSize * 0.5,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        TextField(
                          // controller: controllerNombreText,
                          //autofocus: true,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            hintText: 'Nombre de materia',
                            // labelText: 'Nombre de materia',
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                // controller: controllerNombreText,
                                //autofocus: true,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
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
                                textCapitalization:
                                    TextCapitalization.sentences,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
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
        ],
      ),
    );
  }
}
