import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Editar Perfil', style: TextStyle(fontSize: 25),), Divider(),
              CircleAvatar(
                radius: 48, // Image radius
                backgroundImage: NetworkImage('https://whatsondisneyplus.com/wp-content/uploads/2022/06/doctor-strange-icon.png'),
              ),   Divider(), Text('  Editar imagen', style: TextStyle(color: Colors.blue),),     Divider(),

              TextFormField(

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                    hintText: 'Nombre'),
              ), Divider(),
              TextFormField(

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Apellido',
                    hintText: 'Apellido'),
              ), Divider(),

              TextFormField(

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correo',
                    hintText: 'Correo'),
              ), Divider(),

              TextFormField(

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                    hintText: 'Contraseña'),
              ), Divider(),Divider(),


              Container(
                height: 50,
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    'Editar',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
