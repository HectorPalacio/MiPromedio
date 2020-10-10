import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_promedio/src/pages/detalles_materia.dart';

class ListaMaterias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de materias'),
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
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 30,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    '5.0',
                    style: TextStyle(fontSize: _diagonalSize * 0.03),
                    overflow: TextOverflow.ellipsis,
                  ),
                  title: Text(
                    'Inteligencia artificial',
                    style: TextStyle(fontSize: _diagonalSize * 0.03),
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
                          builder: (context) => DetallesMateria()),
                    );
                  },
                );
              },
            ),
          ),
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
    );
  }
}
