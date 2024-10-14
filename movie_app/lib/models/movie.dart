// lib/models/movie.dart

class Movie {
  final String title;
  final String imagePath;
  final String description; // Nuevo campo de descripción

  Movie({
    required this.title,
    required this.imagePath,
    required this.description, // Añadir al constructor
  });
}
