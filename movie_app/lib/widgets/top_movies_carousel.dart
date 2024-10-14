// lib/widgets/top_movies_carousel.dart

import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../screens/movie_detail_screen.dart';

class TopMoviesCarousel extends StatelessWidget {
  final List<Movie> movies;

  TopMoviesCarousel({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Ajusta la altura según tus necesidades
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return _buildMovieCard(context, movies[index]);
        },
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context, Movie movie) {
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
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            // Imagen de la película
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                movie.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            // Degradado para el texto
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black87, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.all(8.0),
                child: Text(
                  movie.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
