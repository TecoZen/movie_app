// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../widgets/movie_category.dart';
import '../models/movie.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> _allMovies = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    final String response = await rootBundle.loadString('assets/movies.json');
    final data = await json.decode(response);
    setState(() {
      _allMovies = (data['movies'] as List)
          .map((json) => Movie.fromJson(json))
          .toList();
    });
  }

  List<Movie> getMoviesByCategory(String category) {
    return _allMovies
        .where((movie) => movie.category == category)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (_allMovies.isEmpty) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      return Scaffold(
        // Fondo de pantalla
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
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
                  // Top 10 Películas
                  MovieCategory(
                    categoryTitle: 'Top 10 Películas',
                    movieList: getMoviesByCategory('Top 10'),
                  ),
                  SizedBox(height: 20),
                  // Películas de Terror
                  MovieCategory(
                    categoryTitle: 'Películas de Terror',
                    movieList: getMoviesByCategory('Terror'),
                  ),
                  // Romance
                  MovieCategory(
                    categoryTitle: 'Romance',
                    movieList: getMoviesByCategory('Romance'),
                  ),
                  // Acción
                  MovieCategory(
                    categoryTitle: 'Acción',
                    movieList: getMoviesByCategory('Acción'),
                  ),
                  // Infantiles
                  MovieCategory(
                    categoryTitle: 'Infantiles',
                    movieList: getMoviesByCategory('Infantiles'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
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
}
