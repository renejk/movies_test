import 'package:get/get.dart';
import 'package:movies_test/models/movie.dart';
import 'package:movies_test/services/datos.dart';

class MovieController extends GetxController {
  //colecciones
  List<Movie> movies = [];
  List<Movie> news = [];
  //variables
  bool load = false, reload = false;

  @override
  void onInit() async {
    super.onInit();
    movies = await loadMovies(1);
    news = await loadMovies(2);
    update();
  }

  void reloadData() async {
    movies = await loadMovies(1);
    news = await loadMovies(2);
    update();
  }

//consultar peliculas por pagina
  Future<List<Movie>> loadMovies(int page) async {
    reload = false;
    load = true;
    var response = await Data.instance.loadMovies(page);
    if (response["succes"]) {
      var data = response["response"] as List;
      load = false;
      List<Movie> x = [];
      for (var element in data) {
        x.add(Movie.fromJson(element));
      }
      return x;
    } else {
      reload = true;
      return [];
    }
  }

//cargar imagen por url
  loadImage(String url) {
    return 'https://image.tmdb.org/t/p/w500$url';
  }
}
