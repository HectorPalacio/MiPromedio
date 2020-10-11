import 'package:get/get.dart';
import 'package:mi_promedio/src/models/materias_model.dart';
import 'package:mi_promedio/src/provider/db_promedio.dart';

class MateriaController extends GetxController {
  static void guardarMateria(MateriasModel nuevaMateria) async {
    await DBProvider.db.nuevaMateria(nuevaMateria);
  }

  Future<List<MateriasModel>> consultarMaterias() async {
    return await DBProvider.db.getTodasMaterias();
  }
}
