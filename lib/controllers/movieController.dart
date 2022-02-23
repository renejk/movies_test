import 'package:get/get.dart';
import 'package:movies_test/models/movie.dart';
import 'package:movies_test/services/datos.dart';

class MovieController extends GetxController {
  List<Movie> movies = [];
  bool load = false, reload = false;
  int page = 1, totalPages = 0;
  @override
  void onInit() async {
    super.onInit();
    await loadMovies(page);
  }

  Future loadMovies(int page) async {
    reload = false;
    load = true;
    var response = await Data.instance.loadMovies(page);
    if (response["state"]) {
      var data = response["response"];
      data.forEach((element) {
        movies.add(Movie.fromJson(element));
      });
      totalPages = response["totalPages"];
      print(movies.length);
      load = false;
      update();
    } else {
      reload = true;
      update();
    }
  }

  skip(String opt) {
    switch (opt) {
      case "next":
        if (page >= totalPages) return;
        page++;
        loadMovies(page);
        break;
      case "prev":
        if (page <= 1) return;
        page--;
        loadMovies(page);
        break;
      case "skip":
        page = totalPages;
        loadMovies(page);
        break;
      case "back":
        page = 1;
        loadMovies(page);
        break;
      default:
    }
  }

  loadImage(String url) {
    return 'https://image.tmdb.org/t/p/w500$url';
  }
}
