import 'package:asistenciaupeu_frontend/modelo/EspecieanimalModelo.dart';
import 'package:asistenciaupeu_frontend/modelo/GenericModelo.dart';
import 'package:asistenciaupeu_frontend/util/UrlApi.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

part 'especieanimal_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class EspecieanimalApi {
  factory EspecieanimalApi(Dio dio, {String baseUrl}) = _EspecieanimalApi;

  static EspecieanimalApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return EspecieanimalApi(dio);
  }

  @GET("/asis/especie/list")
  Future<List<EspecieanimalModelo>> getEspecieanimal(
      @Header("Authorization") String token);

  @POST("/asis/especie/crear")
  Future<EspecieanimalModelo> createEspecieanimal(
      @Header("Authorization") String token,
      @Body() EspecieanimalModelo especieanimal);

  @GET("/asis/especie/buscar/{id}")
  Future<EspecieanimalModelo> findEspecieanimal(
      @Header("Authorization") String token, @Path("id") int id);

  @DELETE("/asis/especie/eliminar/{id}")
  Future<GenericModelo> deleteEspecieanimal(
      @Header("Authorization") String token, @Path("id") int id);

  @PUT("/asis/especie/editar/{id}")
  Future<EspecieanimalModelo> updateEspecieanimal(
      @Header("Authorization") String token,
      @Path("id") int id,
      @Body() EspecieanimalModelo especieanimal);
}
