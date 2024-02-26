class Movie {
  String name;
  String poster;

  Movie({
    required this.name,
    required this.poster,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      name: json['name'],
      poster: json['poster'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'poster': poster,
    };
  }
}
