import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_project/views/login.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController correo = TextEditingController();
    TextEditingController contra = TextEditingController();
    TextEditingController nombre = TextEditingController();
    TextEditingController apellido = TextEditingController();


    Future registro()async{

      var url ="http://repo001.000webhostapp.com/registro.php";
      var response = await http.post(Uri.parse(url),body:{

        "correo" : correo.text,
        "contra": contra.text,
        "nombre": nombre.text,
        "apellido": apellido.text,

      });
      var data = json.decode(response.body);

      if(data == "Error" ){

        Fluttertoast.showToast(
            msg: "Este usuario exsite",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }else{
        Fluttertoast.showToast(
            msg: "Registración exitosa!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0
        );


      }

    }

    return Scaffold(
      backgroundColor: Colors.black,

      body: SingleChildScrollView(

        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                  /*decoration: BoxDecoration(
                        color: Colors.red,*/


                  decoration: BoxDecoration(image: DecorationImage(

                    image: NetworkImage('https://lumiere-a.akamaihd.net/v1/images/en_dplus_lg_r_2x_54572343.png'),


                  )),
                ),



              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                controller: nombre,

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                    hintText: 'Ingresa tu nombre'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                controller: apellido,

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Apellido',
                    hintText: 'Ingresa tu apellido'),
              ),

            ),


            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: correo,

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correo',
                    hintText: 'Ingresa tu correo'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                controller: contra,

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                    hintText: 'Ingresa tu contraseña'),
              ),
            ),

            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Ya tengo cuenta',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  registro();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Login()));

                },
                child: Text(
                  'Registrarme',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),

          ],
        ),
      ),
    );


  }
}
