import 'package:flutter/material.dart';


class Descargas extends StatelessWidget {
  const Descargas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    List<String> descargas = ['https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/spider-man-no-way-home-1661253004.jpg',
    'http://cdn.shopify.com/s/files/1/0558/4145/6296/products/Deadpoolv5.jpg?v=1621705283',
    'https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_.jpg'
    ];

    List<String> titulo = ['Spiderman: No Way Home',
    'Deadpool',
    'Guardians of the Galaxy Vol.2'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 210,
                  width: 100,
                  child: Image.network(descargas[0]),
                ),

                Flexible(   //Flexible = acomoda al ancho de la pantalla en caso de error
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                        Text(titulo[0], style: TextStyle(fontSize: 25),),
                        Divider(),

                        Text('lorem ipsum')
                      ]
                    ),
                  ),
                ),
              ],
            ),

            Row(

              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 210,
                  width: 100,
                  child: Image.network(descargas[1]),

                ),

                Flexible(   //Flexible = acomoda al ancho de la pantalla en caso de error
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(titulo[1], style: TextStyle(fontSize: 25),),
                          Divider(),

                          Text('lorem ipsum')
                        ]
                    ),
                  ),
                ),
              ],
            ),


            Row(

              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 210,
                  width: 100,
                  child: Image.network(descargas[2]),

                ),

                Flexible(   //Flexible = acomoda al ancho de la pantalla en caso de error
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(titulo[2], style: TextStyle(fontSize: 25),),
                          Divider(),

                          Text('lorem ipsum')
                        ]
                    ),
                  ),
                ),
              ],
            ),


          ],




        ),
      ),
    );
  }
}
