import 'package:flutter/material.dart';

//Gestor de cambios (cambio de light theme a dark
class ThemeProvider extends ChangeNotifier{

  ThemeData currentTheme;

  ThemeProvider({
    required bool isDarkmode
  }): currentTheme = isDarkmode ? ThemeData.dark() : ThemeData.light();

  setLightMode(){
    currentTheme = ThemeData.light();
    notifyListeners();
  }
  setDarkMode(){
    currentTheme = ThemeData.dark();
    notifyListeners();
  }


}