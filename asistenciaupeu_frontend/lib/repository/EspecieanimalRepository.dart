import 'package:asistenciaupeu_frontend/apis/especieanimal_api.dart';
import 'package:asistenciaupeu_frontend/modelo/EspecieanimalModelo.dart';
import 'package:asistenciaupeu_frontend/modelo/GenericModelo.dart';
import 'package:asistenciaupeu_frontend/util/TokenUtil.dart';
import 'package:dio/dio.dart';

class EspecieanimalRepository {
  EspecieanimalApi? especieanimalApi;

  EspecieanimalRepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    especieanimalApi = EspecieanimalApi(_dio);
  }

  Future<List<EspecieanimalModelo>> getEspecieanimal() async {
    var dato = await especieanimalApi!
        .getEspecieanimal(TokenUtil.TOKEN)
        .then((value) => value);
    return await dato;
  }

  Future<GenericModelo> deleteEspecieanimal(int id) async {
    return await especieanimalApi!.deleteEspecieanimal(TokenUtil.TOKEN, id);
  }

  Future<EspecieanimalModelo> updateEspecieanimal(
      int id, EspecieanimalModelo especieanimal) async {
    return await especieanimalApi!
        .updateEspecieanimal(TokenUtil.TOKEN, id, especieanimal);
  }

  Future<EspecieanimalModelo> createEspecieanimal(
      EspecieanimalModelo especieanimal) async {
    return await especieanimalApi!
        .createEspecieanimal(TokenUtil.TOKEN, especieanimal);
  }
}
