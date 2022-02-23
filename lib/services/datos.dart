import 'package:movies_test/models/movie.dart';
import 'package:movies_test/services/conexion.dart';

class Data {
  Data._internal();
  static final Data _instance = Data._internal();
  static Data get instance => _instance;

  String apiKey = "7e29372022d5809b075319aeced84079";
  static const baseUrl = 'https://api.themoviedb.org/3/';

  Future loadMovies(int page) async {
    try {
      var conexion = Conexion();
      conexion.setDio(baseUrl);
      var response =
          await conexion.dio.get("/movie/popular?api_key=$apiKey&page=$page");
      List<dynamic> data = response.data["results"];
      return {
        "state": true,
        "response": data.map((e) => Movie.fromJson(response.data)).toList()
      };
    } catch (e) {
      print(e.toString());
      return {"state": false, "response": e.toString()};
    }
  }
}
