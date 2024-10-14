// lib/widgets/movie_category.dart
// lib/widgets/movie_category.dart

// lib/widgets/movie_category.dart

import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../screens/movie_detail_screen.dart';

class MovieCategory extends StatelessWidget {
  final String categoryTitle;
  final List<Movie> movieList;

  MovieCategory({required this.categoryTitle, required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título de la categoría
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            categoryTitle,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Cambiamos el color del texto
            ),
          ),
        ),
        SizedBox(height: 8),
        // Lista horizontal de películas
        Container(
          height: 180, // Ajusta la altura si es necesario
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              return _buildMovieCard(movieList[index], context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMovieCard(Movie movie, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegar a la pantalla de detalles
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(movie: movie),
          ),
        );
      },
      child: Container(
        width: 120, // Ajusta el ancho si es necesario
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            // Imagen de la película con sombras y bordes redondeados
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                movie.imagePath,
                fit: BoxFit.cover,
                height: 140,
                width: 120,
              ),
            ),
            SizedBox(height: 5),
            // Título de la película
            Text(
              movie.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white, // Cambiamos el color del texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
