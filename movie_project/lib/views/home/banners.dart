import 'package:flutter/material.dart';

class BannerMovies extends StatelessWidget {
  const BannerMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    List<String> portadas = ['https://i.pinimg.com/originals/0a/41/39/0a41392a6ed390c85eb458872edc6bb2.jpg','https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2011/05/Game-Of-Thrones.png?fit=1280%2C720&quality=50&strip=all&ssl=1'];

    return Container(

        child: Padding(

        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 160, // Constrain height.
          child: ListView(

              scrollDirection: Axis.horizontal,
              children: List.generate(portadas.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95, //Ocupar ancho de pantalla
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      image: DecorationImage(
                          image: NetworkImage(portadas[index]),
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                );
              })


          ),
    )
    ),
      );
  }
}
