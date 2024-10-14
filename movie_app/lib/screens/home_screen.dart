// lib/screens/home_screen.dart
// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../widgets/movie_category.dart';
import '../models/movie.dart';
import '../widgets/top_movies_carousel.dart'; // Si estás usando el carrusel

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo de pantalla
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'), // Asegúrate de tener esta imagen
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBar personalizado
                _buildCustomAppBar(),
                SizedBox(height: 20),
                // Carrusel de Top 10 películas (opcional)
                MovieCategory(
                  categoryTitle: 'Top 10 Películas',
                  movieList: getTop10Movies(),
                ),
                SizedBox(height: 20),
                // Películas de Terror
                MovieCategory(
                  categoryTitle: 'Películas de Terror',
                  movieList: getHorrorMovies(),
                ),
                // Romance
                MovieCategory(
                  categoryTitle: 'Romance',
                  movieList: getRomanceMovies(),
                ),
                // Acción
                MovieCategory(
                  categoryTitle: 'Acción',
                  movieList: getActionMovies(),
                ),
                // Infantiles
                MovieCategory(
                  categoryTitle: 'Infantiles',
                  movieList: getKidsMovies(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'Streaming de Películas',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  // Métodos para obtener listas de películas (con descripciones)

  List<Movie> getTop10Movies() {
    return [
      Movie(
        title: 'Película 1',
        imagePath: 'assets/images/pelicula1.jpg',
        description: 'Esta es la descripción de Película 1.',
      ),
      Movie(
        title: 'Película 2',
        imagePath: 'assets/images/pelicula2.jpg',
        description: 'Esta es la descripción de Película 2.',
      ),
      Movie(
        title: 'Película 3',
        imagePath: 'assets/images/pelicula3.jpg',
        description: 'Esta es la descripción de Película 3.',
      ),
      Movie(
        title: 'Película 4',
        imagePath: 'assets/images/pelicula4.jpg',
        description: 'Esta es la descripción de Película 4.',
      ),
      Movie(
        title: 'Película 5',
        imagePath: 'assets/images/pelicula5.jpg',
        description: 'Esta es la descripción de Película 5.',
      ),
      Movie(
        title: 'Película 6',
        imagePath: 'assets/images/pelocula6.jpeg',
        description: 'Esta es la descripción de Película 6.',
      ),
      Movie(
        title: 'Película 7',
        imagePath: 'assets/images/pelicula7.jpg',
        description: 'Esta es la descripción de Película 7.',
      ),
      Movie(
        title: 'Película 8',
        imagePath: 'assets/images/pelicula8.jpeg',
        description: 'Esta es la descripción de Película 8.',
      ),
      Movie(
        title: 'Película 9',
        imagePath: 'assets/images/pelicula9.jpg',
        description: 'Esta es la descripción de Película 9.',
      ),
      Movie(
        title: 'Película 10',
        imagePath: 'assets/images/pelicula10.jpg',
        description: 'Esta es la descripción de Película 10.',
      ),
    ];
  }

  List<Movie> getHorrorMovies() {
    return [
      Movie(
        title: 'Terror 1',
        imagePath: 'assets/images/terror1.jpg',
        description: 'Descripción de la película de terror 1.',
      ),
      Movie(
        title: 'Terror 2',
        imagePath: 'assets/images/terror2.jpg',
        description: 'Descripción de la película de terror 2.',
      ),
      Movie(
        title: 'Terror 3',
        imagePath: 'assets/images/terror3.jpeg',
        description: 'Descripción de la película de terror 3.',
      ),
    ];
  }

  List<Movie> getRomanceMovies() {
    return [
      Movie(
        title: 'Romance 1',
        imagePath: 'assets/images/romance1.jpg',
        description: 'Descripción de la película de romance 1.',
      ),
      Movie(
        title: 'Romance 2',
        imagePath: 'assets/images/romance2.jpeg',
        description: 'Descripción de la película de romance 2.',
      ),
      Movie(
        title: 'Romance 3',
        imagePath: 'assets/images/romance3.webp',
        description: 'Descripción de la película de romance 3.',
      ),
    ];
  }

  List<Movie> getActionMovies() {
    return [
      Movie(
        title: 'Acción 1',
        imagePath: 'assets/images/accion1.jpg',
        description: 'Descripción de la película de acción 1.',
      ),
      Movie(
        title: 'Acción 2',
        imagePath: 'assets/images/accion2.jpg',
        description: 'Descripción de la película de acción 2.',
      ),
      Movie(
        title: 'Acción 3',
        imagePath: 'assets/images/accion3.jpg',
        description: 'Descripción de la película de acción 3.',
      ),
    ];
  }

  List<Movie> getKidsMovies() {
    return [
      Movie(
        title: 'Infantil 1',
        imagePath: 'assets/images/infantil1.jpg',
        description: 'Descripción de la película infantil 1.',
      ),
      Movie(
        title: 'Infantil 2',
        imagePath: 'assets/images/infantil2.jpeg',
        description: 'Descripción de la película infantil 2.',
      ),
      Movie(
        title: 'Infantil 3',
        imagePath: 'assets/images/infantil3.jpg',
        description: 'Descripción de la película infantil 3.',
      ),
    ];
  }
}
