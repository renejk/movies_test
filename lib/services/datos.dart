import 'package:movies_test/services/conexion.dart';

class Data {
  Data._internal();
  static final Data _instance = Data._internal();
  static Data get instance => _instance;

  String apiKey = "7e29372022d5809b075319aeced84079";
  static const baseUrl = 'https://api.themoviedb.org/3/';

  Future<Map> loadMovies(int page) async {
    try {
      //inicializar conexion
      var conexion = Conexion();
      //inicializar dio
      conexion.setDio(baseUrl);
      //consulta api
      var response =
          await conexion.dio.get("/movie/popular?api_key=$apiKey&page=$page");
      var data = response.data["results"];
      //respuesta en mapa
      return {"succes": true, "response": data};
    } catch (e) {
      return {"succes": false, "response": e.toString()};
    }
  }
}
