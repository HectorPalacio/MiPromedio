import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mi_promedio/src/pages/detalles_corte.dart';
import 'package:mi_promedio/src/widgets/boton_gordo.dart';

class DetallesMateria extends StatelessWidget {
  final String nombreAsignatura;

  DetallesMateria({this.nombreAsignatura});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.nombreAsignatura}'),
      ),
      body: _construirBody(context),
    );
  }

  Widget _construirBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Column(
            children: <Widget>[
              _crearBotonesGordos(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearBotonesGordos(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        BotonGordo(
          color1: Color(0xffEF40FF),
          color2: Color(0xff8130E6),
          icon: FontAwesomeIcons.info,
          texto: 'Corte 1',
          onPress: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => DetalleCorte(
                    numeroCorte: 'Primer',
                  ),
                ));
          },
        ),
        SizedBox(height: 20),
        BotonGordo(
          color1: Color(0xff8130E6),
          color2: Color(0xff4C94E6),
          icon: FontAwesomeIcons.info,
          texto: 'Corte 2',
          onPress: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => DetalleCorte(numeroCorte: 'Segundo'),
                ));
          },
        ),
        SizedBox(height: 20),
        BotonGordo(
          color1: Color(0xff4C94E6),
          color2: Color(0xff40EFFF),
          icon: FontAwesomeIcons.info,
          texto: 'Corte 3',
          onPress: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => DetalleCorte(numeroCorte: 'Tercer'),
                ));
          },
        ),
      ],
    );
  }
}
