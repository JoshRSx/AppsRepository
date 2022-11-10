import 'package:flutter/material.dart';
import 'package:peliculas/widgets/prox_movies.dart';

import 'package:provider/provider.dart';

import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Image.network('https://lumiere-a.akamaihd.net/v1/images/en_dplus_lg_r_2x_54572343.png', width: 130),
          elevation: 0,

          backgroundColor: Colors.black,
          centerTitle: true,
          automaticallyImplyLeading: false,  //Borrar el btn de 'volver'
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.connected_tv,
                color: Colors.white,
              ),
              onPressed: () {
              },
            )
          ],
        ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // Tarjetas principales
            CardSwiper( movies: moviesProvider.onDisplayMovies ),

            // Slider de películas
            MovieSlider(
              movies: moviesProvider.popularMovies,// populares,
              title: 'Populares', // opcional
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),

            ProxEstrenos(),

            
          ],
        ),
      )
    );
  }
}