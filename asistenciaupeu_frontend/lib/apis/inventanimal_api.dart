import 'package:asistenciaupeu_frontend/modelo/GenericModelo.dart';
import 'package:asistenciaupeu_frontend/modelo/InventanimalModelo.dart';
import 'package:asistenciaupeu_frontend/util/UrlApi.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'inventanimal_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class InventanimalApi {
  factory InventanimalApi(Dio dio, {String baseUrl}) = _InventanimalApi;
  static InventanimalApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return InventanimalApi(dio);
  }

  @GET("/asis/invent/list")
  Future<List<InventanimalxRespModelo>> getInventanimalpa(
      @Header("Authorization") String token);

  @POST("/asis/invent/crear")
  Future<InventanimalxRespModelo> createInventanimalpa(
      @Header("Authorization") String token,
      @Body() InventanimalxRespModelo inventanimalpa);

  @DELETE("/asis/invent/eliminar/{id}")
  Future<GenericModelo> deleteInventanimalpa(
      @Header("Authorization") String token, @Path("id") int id);

  @PATCH("/asis/invent/editar/{id}")
  Future<InventanimalxRespModelo> updateInventanimalpa(
      @Header("Authorization") String token,
      @Path("id") int id,
      @Body() InventanimalxRespModelo inventanimalpa);
}
