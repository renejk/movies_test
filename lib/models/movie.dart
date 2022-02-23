class Movie {
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

  static fromJson(Map<String, dynamic> json) {
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
      voteAverage: json['vote_average'] ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}