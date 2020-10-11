import 'dart:io';

import 'package:mi_promedio/src/models/actividad_model.dart';
import 'package:mi_promedio/src/models/materias_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'PromedioDB.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE Materias ('
            ' idMateria INTEGER PRIMARY KEY,'
            ' nombreMateria TEXT,'
            ' idActividad INTEGER,'
            ' primerCorte NUMERIC(3,2),'
            ' segundoCorte NUMERIC(3,2),'
            ' tecerCorte NUMERIC(3,2),'
            ' definitiva NUMERIC(3,2)'
            ')');
        await db.execute('CREATE TABLE Actividad ('
            ' idActividad INTEGER PRIMARY KEY,'
            ' nombreActividad TEXT,'
            ' notaActividad NUMERIC(3,2),'
            ' porcentaje INTEGER,'
            ' numeroCorte INTEGER'
            ')');
      },
    );
  }

  // crearTabla() async {
  //   final db = await database;
  //   final res = await db.execute('CREATE TABLE Clientes ('
  //       ' id INTEGER PRIMARY KEY,'
  //       ' nombre TEXT,'
  //       ' telefono TEXT,'
  //       ' email TEXT,'
  //       ' edad INTEGER'
  //       ')');
  //   return res;
  // }

  // borrarTabla() async {
  //   final db = await database;
  //   final res = await db.execute('DROP TABLE Actividad');
  //   return res;
  // }

  //MATERIAS--------------------------------------------------------

  //Registrar materia
  nuevaMateria(MateriasModel nuevaMateria) async {
    final db = await database;
    final res = await db.insert('Materias', nuevaMateria.toJson());
    return res;
  }

  //Buscar materia por ID
  Future<MateriasModel> getMateriaId(int id) async {
    final db = await database;
    final res =
        await db.query('Materias', where: 'idMateria = ?', whereArgs: [id]);
    return res.isNotEmpty ? MateriasModel.fromJson(res.first) : null;
  }

  //Consultar todos
  Future<List<MateriasModel>> getTodasMaterias() async {
    final db = await database;
    final res = await db.query('Materias');

    List<MateriasModel> list = res.isNotEmpty
        ? res.map((c) => MateriasModel.fromJson(c)).toList()
        : [];
    return list;
  }

  //Actualizar materia por ID
  Future<int> updateMateria(MateriasModel nuevaMateria) async {
    final db = await database;
    final res = await db.update('Materias', nuevaMateria.toJson(),
        where: 'idMateria = ?', whereArgs: [nuevaMateria.idMateria]);
    return res;
  }

  //Eliminar materia por ID
  Future<int> deleteMateria(int id) async {
    final db = await database;
    final res =
        await db.delete('Materias', where: 'idMateria = ?', whereArgs: [id]);
    return res;
  }

  // Future<int> deleteAll() async {
  //   final db = await database;
  //   final res = await db.rawDelete('DELETE FROM Clientes');
  //   return res;
  // }

  //ACTIVIDAD-----------------------------------------------------

  //Registrar actividad
  nuevaActividad(ActividadModel nuevaActividad) async {
    final db = await database;
    final res = await db.insert('Materias', nuevaActividad.toJson());
    return res;
  }

  //Buscar actividad por ID
  Future<ActividadModel> getActividadId(int id) async {
    final db = await database;
    final res =
        await db.query('Actividad', where: 'idActividad = ?', whereArgs: [id]);
    return res.isNotEmpty ? ActividadModel.fromJson(res.first) : null;
  }

  //Consultar todos
  Future<List<ActividadModel>> getTodasActividades() async {
    final db = await database;
    final res = await db.query('Actividad');

    List<ActividadModel> list = res.isNotEmpty
        ? res.map((c) => ActividadModel.fromJson(c)).toList()
        : [];
    return list;
  }

  //Actualizar actividad por ID
  Future<int> updateActividad(ActividadModel nuevaActividad) async {
    final db = await database;
    final res = await db.update('Actividad', nuevaActividad.toJson(),
        where: 'idActividad = ?', whereArgs: [nuevaActividad.idActividad]);
    return res;
  }

  //Eliminar actividad por ID
  Future<int> deleteActividad(int id) async {
    final db = await database;
    final res =
        await db.delete('Actividad', where: 'idActividad = ?', whereArgs: [id]);
    return res;
  }

  // Future<int> deleteAll() async {
  //   final db = await database;
  //   final res = await db.rawDelete('DELETE FROM Clientes');
  //   return res;
  // }
}
