import 'package:flutter/material.dart';
import 'package:movie_project/views/home/banners.dart';
import 'package:movie_project/views/home/prox_estrenos.dart';
import 'package:movie_project/views/home/nuevos_estrenos.dart';
import 'package:movie_project/views/home/series.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';


class Home extends StatefulWidget {

  @override
  HomeState createState() => HomeState();
}



class HomeState extends State<Home>{

  //API
  List trendingmovies = [];
  List tv = [];

  final String apiKey = 'f4cc63931e9f3403f1642c1799ce273e';
  String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNGNjNjM5MzFlOWYzNDAzZjE2NDJjMTc5OWNlMjczZSIsInN1YiI6IjYzNGVjZGNkMDc0NWUxMDA3OTUxYTVlNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pVW7gEvriduS5OHWV3z8sJZNlmjAJPCi8Bo-MkMdofc';


  @override
  void initState(){
    super.initState();
    loadmovies();
  }

  loadmovies() async{

    TMDB tmdbWithCustomLogs = TMDB(
        ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(
            showLogs: true,
            showErrorLogs: true
        ));

    //Cogemos resultados segun clasificacion
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    //  Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      //Estado on
      trendingmovies = trendingresult['results'];
      //    topratedresult = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(tv);

  }

  @override
  Widget build (BuildContext context){

    //Conexion BD
    return Scaffold(

      body: ListView(
        children: [
          BannerMovies(),
          Series(tv:tv),
          NuevosEstrenosMovies(trending: trendingmovies),
          ProxEstrenos(),
        ],
      ),


    );
  }
}