import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  
  final String name, description, bannerurl, posterurl, vote, launch_on;
  
  const Description({Key? key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch_on}) : super(key: key);

  
  //Descripcion de la pelicula
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(
        child: ListView(
          children: [
        
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(bannerurl, fit: BoxFit.cover),
                )),

                Positioned(
                  bottom: 10,
                    child:
                    Text('+ Puntuación: '+vote, style: TextStyle(fontSize: 15), ),
                    )
              ],
            ),
          ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              //Si los valores son nulos, entonces name = Error
              child:  Text( name!=null ? name :'Error json', style: TextStyle(fontSize: 24),),
            ),

            Container(padding: EdgeInsets.only(left: 10),
                child: Text('Fecha de estreno: '+launch_on, style: TextStyle(fontSize: 14),),),

            Row(
              children: [
                Flexible(   //Flexible = acomoda al ancho de la pantalla en caso de error
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25) ,
                    child: Container(
                      child: Text(description, style: TextStyle(fontSize: 18, height: 1.7),),
                    ),
                  ),
                ),
              ],
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25) ,
              child: Column(

                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [

                  TextButton(



                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () { },
                    child: Text('Ver pelicula', style: TextStyle(fontSize: 20, height: 1.7)),
                  ),
                  Divider(),
                  TextButton(



                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () { },
                    child: Text('Descargar', style: TextStyle(fontSize: 20, height: 1.7)),
                  ),



                ],





              ),
            )


          ],
        ),
      ),

    );
  }
}
