import 'package:flutter/material.dart';

class ProxEstrenos extends StatelessWidget {
  const ProxEstrenos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> proximos_estr = ['https://cdna.artstation.com/p/assets/images/images/032/463/812/large/rahal-nejraoui-deadpool-3-poster-design-by-rahalarts.jpg?1606509308',
      'https://i.pinimg.com/originals/c5/e6/46/c5e646d42f69c7a2032952a58b60a8c9.png',
      'https://preview.redd.it/5x8yz7vguwq71.jpg?auto=webp&s=50f059dc9de2bc2f39c77cde0229476ac3a371b0'
    ];

    return       Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(

            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
            child:Text("Proximos estrenos:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, ))
        ),


        Padding(

          padding: const EdgeInsets.all(8.0),
          child: SizedBox(


            height: 240, // Constrain height.
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(proximos_estr.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 158,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(
                            image: NetworkImage(proximos_estr[index]),
                            fit: BoxFit.fill //--> ocupar todo el contenido del container
                        ),
                      ),
                    ),
                  );
                })


            ),
          ),
        ),
      ],
    );
  }
}
