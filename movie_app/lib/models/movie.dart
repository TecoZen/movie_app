// lib/models/movie.dart

class Movie {
  final int id;
  final String title;
  final String description;
  final String imagePath;
  final String category;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.category,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imagePath: json['imagePath'],
      category: json['category'],
    );
  }
}
