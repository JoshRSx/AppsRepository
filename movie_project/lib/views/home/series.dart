import 'package:flutter/material.dart';

class Series extends StatelessWidget {
  final List tv;

  const Series({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(10),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Padding(
              padding: const EdgeInsets.all(9.0),
              child:Text("Series Populares:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          Container(
            height: 220,
            //Height of json array
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return InkWell(
                  onTap:(){

                  } ,
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(

                          height: 200,
                          decoration: BoxDecoration(image: DecorationImage(

                            image: NetworkImage('https://image.tmdb.org/t/p/w500/'+tv[index]['poster_path']),


                          )),

                        ),

                   /*     Container(
                          child: Text( tv[index]['original_name'] !=null?
                          tv[index]['original_name']: 'Loading'),
                        )
*/
                      ],
                    ),
                  ),
                );

              },
              itemCount:  tv.length,
            ),
          ),


        ],
      ),


    );
  }
}
