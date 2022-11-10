import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_project/main.dart';
import 'package:movie_project/providers/theme_provider.dart';
import 'package:movie_project/shared_preferences/preferences.dart';
import 'package:movie_project/views/home/home.dart';
import 'package:movie_project/views/register.dart';

import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';


void main() async{ //Cambiar asyncrono para cambiar con sharedPreferences

  WidgetsFlutterBinding.ensureInitialized(); //Inicializar SharedPreferences

  await Preferences.init();

  runApp(
    //El provider global va aquí


    MultiProvider(
      providers:[     //Checkar estado del theme mediante Preferences
        ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
      ],
      child: MyApp(), //Mostrar MyApp()
    ),

  );
}

class MyApp extends StatefulWidget {  //Se cambia a stateful para que los shared tengan cambios
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {


    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
        theme: Provider.of<ThemeProvider>(context).currentTheme,  //Cambiar de tema segun pref. del usuario


  /*    themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
*/
      ),

    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  //Conexion BD
  TextEditingController correo = TextEditingController(text: '');
  TextEditingController contra = TextEditingController(text: '');

  Future<void> login()async {   //se agregó void!!------
    var url = "http://repo001.000webhostapp.com/login.php";
    var response = await http.post(Uri.parse(url), body: {

      "correo": correo.text,
      "contra": contra.text
    });

    var data = json.decode(response.body);

    if(data == "Success"){
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Main()));

    }
    else{

      Fluttertoast.showToast(
          msg: "Correo y/o contraseña incorrectos",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }





  }




    @override
  Widget build(BuildContext context) {



    return Scaffold(


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
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(

                controller: correo,

       onChanged: (value) {
        Preferences.correo = value;
        setState(() {



        });
      },

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
              child: TextFormField(

                controller: contra,

                onChanged: (value) {
                  Preferences.contra = value;
                  setState(() {

                  });
                },

                decoration: InputDecoration(

                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                    hintText: 'Ingresa tu contraseña'),
              ),
            ),
            TextButton(
              onPressed: (){
               //Olvide mi contraseña (Screen)
              },
              child: Text(
                'Olvidé mi contraseña',
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

                  login();

                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            TextButton(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Register()));
              },
              child: Text(
                'Crear cuenta',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}