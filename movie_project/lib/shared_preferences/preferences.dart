


import 'package:shared_preferences/shared_preferences.dart';

class Preferences{  //guardar cambios del usuario en la app

  static late SharedPreferences _prefs;

  //prop globales
  //Configuramos switch/radioBtn y evento de cambio de nombre
  static String _correo = '';
  static String _contra = '';
  static bool _isDarkMode = false;


  static Future init() async {

    _prefs = await SharedPreferences.getInstance();
  }

  static String get correo{
    return _prefs.getString('correo') ?? _correo;

  }
  static set correo (String correo){

    _correo = correo;
    _prefs.setString('correo', correo);

  }


  static String get contra{
    return _prefs.getString('contra') ?? _contra;

  }
  static set contra (String contra){

    _contra = contra;
    _prefs.setString('contra', contra);

  }



  static bool get isDarkmode{
    return _prefs.getBool('isDarkmode') ?? _isDarkMode;
  }

//Leer en el dispositivo
  static set isDarkmode (bool value){

    _isDarkMode = value;
    _prefs.setBool('isDarkmode', value);

  }



}