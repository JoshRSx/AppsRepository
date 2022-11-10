import 'package:flutter/material.dart';
import 'package:movie_project/models/description.dart';

class NuevosEstrenosMovies extends StatelessWidget {
  final List trending;

  const NuevosEstrenosMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(




      padding: EdgeInsets.all(10),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Padding(
              padding: const EdgeInsets.all(9.0),
              child:Text("Nuevos Estrenos:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          Container(
            height: 220,
            //Height of json array
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                  return InkWell(
                    onTap:(){
                      //Acceder a la descripcion de cada pelicula
                      Navigator.push(context,MaterialPageRoute(builder:
                      (context)=>
                          Description
                            (name: trending[index]['title'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500/'+trending[index]['backdrop_path'],
                             posterurl: 'https://image.tmdb.org/t/p/w500/'+trending[index]['poster_path'],
                              description: trending[index]['overview'],
                            vote: trending[index]['vote_average'].toString(),
                            launch_on: trending[index]['release_date'],
                          )));


                    } ,
                    child:
                    trending[index]['title']!=null?
                    Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(

                            height: 200,
                            decoration: BoxDecoration(image: DecorationImage(

                              image: NetworkImage('https://image.tmdb.org/t/p/w500/'+trending[index]['poster_path']),


                            )),

                          ),

                          /*
                          Container(
                            child: Text(trending[index]['title'] !=null?
                            trending[index]['title']: 'Loading'),
                          )
*/

                        ],
                      ),
                    ):Container(),
                  );

                },
              itemCount: trending.length,
            ),
          )


        ],
      ),


    );
  }
}
