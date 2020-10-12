import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_promedio/src/bloc/actividad_controller.dart';
import 'package:mi_promedio/src/models/actividad_model.dart';
import 'package:mi_promedio/src/provider/db_promedio.dart';

class DetalleCorte extends StatefulWidget {
  @required
  final String numeroCorte;
  final controllerNuevoNombreActividadText = TextEditingController();
  final controllerNuevoNotaText = TextEditingController();
  final controllerNuevoPorcentajeText = TextEditingController();
  final double definitivaCorte;

  DetalleCorte({Key key, this.numeroCorte, this.definitivaCorte})
      : super(key: key);
  @override
  _DetalleCorteState createState() => _DetalleCorteState();
}

class _DetalleCorteState extends State<DetalleCorte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.numeroCorte} Corte'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // DBProvider.db.deleteAll();
                _agregarActividad(context);
              })
        ],
      ),
      body: _construirBody(),
    );
  }

  Widget _construirBody() {
    int totalPorcentaje;
    final double _sizeWidth = MediaQuery.of(context).size.width;
    final double _sizeHeight = MediaQuery.of(context).size.height;
    final double _diagonalSize =
        sqrt((_sizeHeight * _sizeHeight) + (_sizeWidth * _sizeWidth));
    return Padding(
      padding: EdgeInsets.all(10),
      child: GetBuilder(
          init: ActividadController(),
          builder: (snapshot) {
            return FutureBuilder<List<ActividadModel>>(
                future: snapshot.consultarActividad(),
                builder: (context, snapshot) {
                  return Stack(
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
                                  margin:
                                      EdgeInsets.only(top: _sizeHeight * 0.6),
                                  // color: Colors.red,
                                  width: _sizeWidth,
                                  height: _sizeHeight * 0.3,
                                  child: Column(
                                    children: [
                                      Text(
                                        _calcularNota(snapshot.data),
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: _diagonalSize * 0.15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Que pro',
                                        style: TextStyle(
                                            fontSize: _diagonalSize * 0.04),
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
                        child: (snapshot.data == null)
                            ? Center(
                                child: Text('No hay datos'),
                              )
                            : ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Text(
                                        '${snapshot.data[index].nombreActividad}'),
                                    title: Text(
                                        '${snapshot.data[index].notaActividad.toString()}'),
                                    trailing: Text(
                                        '${snapshot.data[index].porcentaje.toString()}'),
                                    onTap: () {
                                      // _editarActividad(
                                      //   snapshot.data[index].nombreActividad,
                                      //   snapshot.data[index].notaActividad,
                                      //   snapshot.data[index].porcentaje,
                                      //   snapshot.data[index].idActividad,
                                      //   totalPorcentaje,
                                      // );
                                      List<ActividadModel> lista =
                                          new List<ActividadModel>();
                                      lista = snapshot.data;
                                      print(lista.toString());
                                    },
                                  );
                                },
                              ),
                      ),
                    ],
                  );
                });
          }),
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
                controller: widget.controllerNuevoNombreActividadText,
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
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: widget.controllerNuevoPorcentajeText,
                // controller: controllerNombreText,
                //autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: 'Porcentaje de actividad 0-100',
                  // labelText: 'Nombre de materia',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: widget.controllerNuevoNotaText,
                // controller: controllerNombreText,
                //autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: 'Nota de la actividad 0.00-5.00',
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
                if (widget.controllerNuevoNombreActividadText.text == '' ||
                    widget.controllerNuevoPorcentajeText.text == '' ||
                    widget.controllerNuevoNotaText.text == '') {
                  _mostrarAlerta(context);
                } else {
                  final nuevaActividad = ActividadModel(
                    nombreActividad:
                        widget.controllerNuevoNombreActividadText.text,
                    notaActividad:
                        double.parse(widget.controllerNuevoNotaText.text),
                    porcentaje:
                        int.parse(widget.controllerNuevoPorcentajeText.text),
                    numeroCorte: (widget.numeroCorte == 'Primer')
                        ? 1
                        : (widget.numeroCorte == 'Segundo') ? 2 : 3,
                  );
                  ActividadController.guardarActividad(nuevaActividad);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Error al guardar cliente'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Por favor, llene todos los campos'),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

  void _editarActividad(String nombreActividad, double notaActividad,
      int porcentaje, int idActividad, totalPorcentaje) {
    final controllerNombre = TextEditingController(text: nombreActividad);
    final controllerNota =
        TextEditingController(text: notaActividad.toString());
    final controllerPorcentaje =
        TextEditingController(text: porcentaje.toString());
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Editar actividad'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: controllerNombre,
                //controller: widget.controllerNuevoPorcentajeText,
                // controller: controllerNombreText,
                //autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: 'Nombre de actividad',
                  // labelText: 'Nombre de materia',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: controllerNota,
                //controller: widget.controllerNuevoPorcentajeText,
                // controller: controllerNombreText,
                //autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: 'Nota de la actividad',
                  // hintText: 'Nota de la actividad 0.00-5.00',
                  // labelText: 'Nombre de materia',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: controllerPorcentaje,
                //controller: widget.controllerNuevoPorcentajeText,
                // controller: controllerNombreText,
                //autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  // hintText: 'Porcentaje de actividad 0-100',
                  hintText: 'Porcentaje de actividad',
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
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                if (controllerNombre.text == '' ||
                    controllerNota.text == '' ||
                    controllerPorcentaje.text == '') {
                  _mostrarAlerta(context);
                } else {
                  final nuevaActividad = ActividadModel(
                    idActividad: idActividad,
                    nombreActividad: controllerNombre.text,
                    notaActividad: double.parse(controllerNota.text),
                    porcentaje: int.parse(controllerPorcentaje.text),
                    numeroCorte: (widget.numeroCorte == 'Primer')
                        ? 1
                        : (widget.numeroCorte == 'Segundo') ? 2 : 3,
                  );
                  ActividadController.actualizarActividad(nuevaActividad);
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        );
      },
    );
  }

  String _calcularNota(List<ActividadModel> snapshot) {
    List<ActividadModel> ejemplo = snapshot;
    double definitiva = 0;
    for (var i = 0; i < ejemplo.length; i++) {
      definitiva += (ejemplo[i].notaActividad *
              double.parse(ejemplo[i].porcentaje.toString())) /
          100;
    }
    return definitiva.toString();
  }
}
