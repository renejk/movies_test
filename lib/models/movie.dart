class Movie {
  //variables
  late int id, voteCount;
  late bool adult, video;
  late double voteAverage;
  late String backdropPath,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      releaseDate,
      title;
//constructor
  Movie({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
//metodo estatico para parsear json a un objeto de la clase
  static fromJson(Map<String, dynamic> json) {
    var average = json['vote_average'].runtimeType == int
        ? json['vote_average'].toDouble()
        : json['vote_average'];

    return Movie(
      id: json['id'] ?? 0,
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? "",
      originalLanguage: json['original_language'] ?? "",
      originalTitle: json['original_title'] ?? "",
      overview: json['overview'] ?? "",
      posterPath: json['poster_path'] ?? "",
      releaseDate: json['release_date'] ?? "",
      title: json['title'] ?? "",
      video: json['video'] ?? false,
      voteAverage: average,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}
