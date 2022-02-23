import 'package:movies_test/services/conexion.dart';

class Data {
  Data._internal();
  static final Data _instance = Data._internal();
  static Data get instance => _instance;

  String apiKey = "7e29372022d5809b075319aeced84079";
  static const baseUrl = 'https://api.themoviedb.org/3/';

  Future<Map> loadMovies(int page) async {
    try {
      var conexion = Conexion();
      conexion.setDio(baseUrl);
      var response =
          await conexion.dio.get("/movie/popular?api_key=$apiKey&page=$page");
      var data = response.data["results"];
      var totalPages = response.data["total_pages"];
      return {"state": true, "response": data, "totalPages": totalPages};
    } catch (e) {
      return {"state": false, "response": e.toString()};
    }
  }
}
