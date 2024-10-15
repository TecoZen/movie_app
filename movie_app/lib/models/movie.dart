// lib/models/movie.dart

class Movie {
  final int id;
  final String title;
  final String description;
  final String imagePath;
  final String category;
  final double rating;
  final int duration;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.category,
    required this.rating,
    required this.duration,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imagePath: json['imagePath'],
      category: json['category'],
      rating: (json['rating'] as num).toDouble(),
      duration: json['duration'],
    );
  }
}
