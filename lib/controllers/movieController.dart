import 'package:get/get.dart';
import 'package:movies_test/models/movie.dart';
import 'package:movies_test/services/datos.dart';

class MovieController extends GetxController {
  List<Movie> movies = [];
  bool load = false, reload = false;
  @override
  void onInit() async {
    super.onInit();
    await loadMovies();
  }

  Future loadMovies() async {
    reload = false;
    load = true;
    var response = await Data.instance.loadMovies(1);
    if (response["state"]) {
      var data = response["response"];
      data.forEach((element) {
        movies.add(Movie.fromJson(element));
      });
      print(movies.length);
      load = false;
      update();
    } else {
      reload = true;
      update();
    }
  }

  loadImage(String url) {
    return 'https://image.tmdb.org/t/p/w500$url';
  }
}
