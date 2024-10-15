// lib/screens/movie_detail_screen.dart

import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    // Calculamos el ancho y alto de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;

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
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 24, // Reducimos el tamaño de la fuente
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // Imagen principal y contenido superpuesto
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Imagen principal (reducimos su altura)
                        Image.asset(
                          movie.imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200, // Reducimos la altura de 300 a 200
                        ),
                        // Imagen superpuesta y datos adicionales
                        Positioned(
                          top: 150, // Ajustamos la posición vertical
                          left: 16,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Imagen superpuesta (reducimos su tamaño)
                              Container(
                                width: 100, // Reducimos el ancho de 150 a 100
                                height: 150, // Reducimos la altura de 225 a 150
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
                              SizedBox(width: 16),
                              // Información de rating y duración
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 65), // Bajamos un poco la posición
                                  // Rating
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellowAccent),
                                      SizedBox(width: 5),
                                      Text(
                                        '${movie.rating} / 5',
                                        style: TextStyle(fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  // Duración
                                  Row(
                                    children: [
                                      Icon(Icons.access_time, color: Colors.white),
                                      SizedBox(width: 5),
                                      Text(
                                        '${movie.duration} min',
                                        style: TextStyle(fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 130), // Ajustamos el espacio después del Stack
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
