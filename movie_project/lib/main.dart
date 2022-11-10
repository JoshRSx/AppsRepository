import 'package:flutter/material.dart';
import 'package:movie_project/views/descargas/descargas.dart';
import 'package:movie_project/views/home/home.dart';
import 'package:movie_project/views/perfil/perfil.dart';
import 'package:movie_project/providers/theme_provider.dart';

import 'package:movie_project/shared_preferences/preferences.dart';

import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: _title,
      home: Main(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
       brightness: Brightness.dark,
      ),

    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Main> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List _widgetOptions = [

    Home(),


    Text(
      'Index 2: Buscador',
      style: optionStyle,
    ),

   Descargas(),

    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Image.network('https://lumiere-a.akamaihd.net/v1/images/en_dplus_lg_r_2x_54572343.png', width: 130),
        elevation: 0,

        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,  //Borrar el btn de 'volver'

        //==>Icono izquierda
        leading:      Switch(
            value: Preferences.isDarkmode,

            onChanged: (value){

              //AñADIR preferences para e cambio de theme
              Preferences.isDarkmode = value;
              final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

              value ? themeProvider.setDarkMode() : themeProvider.setLightMode();


              setState(() { //=> surgir cambios

              });


            }),

        //==>Icono derecha
        actions: [
          IconButton(
            icon: Icon( Icons.search_outlined ),
            onPressed: () {},
          )
        ],
      ),



      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,

        //Item sin titulo
        showSelectedLabels: false,
        showUnselectedLabels: false,

        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white, size: 30 ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,color: Colors.white, size: 30,),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download, color: Colors.white, size: 30,),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.white,size: 30, ),
            label: "",
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}





