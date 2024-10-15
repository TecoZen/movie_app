// lib/screens/movie_detail_screen.dart

import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // El cuerpo del Scaffold envuelto en un Container con la imagen de fondo
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/detail_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Contenido de la pantalla
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Botón de regreso en la esquina superior izquierda
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    // Título de la película centrado en la parte superior
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // Imagen principal y miniatura superpuesta
                    Stack(
                      clipBehavior: Clip.none, // Permite que los widgets se salgan de los límites
                      children: [
                        // Imagen principal
                        Image.asset(
                          movie.imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 300,
                        ),
                        // Miniatura de la imagen de la película
                        Positioned(
                          top: 220, // Ajusta esta posición vertical según tus necesidades
                          left: 16, // Mueve la miniatura hacia la izquierda
                          child: Container(
                            width: 150,
                            height: 225,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                movie.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 160), // Espacio para acomodar la miniatura superpuesta
                    // Descripción de la película
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        movie.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Puedes agregar más contenido aquí
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
