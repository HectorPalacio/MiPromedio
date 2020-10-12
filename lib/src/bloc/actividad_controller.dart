import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mi_promedio/src/models/actividad_model.dart';
import 'package:mi_promedio/src/provider/db_promedio.dart';

class ActividadController extends GetxController {
  static void guardarActividad(ActividadModel nuevaActividad) async {
    await DBProvider.db.nuevaActividad(nuevaActividad);
  }

  Future<List<ActividadModel>> consultarActividad() async {
    return await DBProvider.db.getTodasActividades();
  }

  static void actualizarActividad(ActividadModel nuevaActividad) async {
    await DBProvider.db.updateActividad(nuevaActividad);
  }
}
