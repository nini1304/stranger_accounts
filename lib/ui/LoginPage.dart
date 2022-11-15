import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // The Scaffold is a widget in Flutter used to implements the basic material design visual layout structure
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingresar'),
        backgroundColor: const Color(0xff252A34),
      ),
      // configurando el fondo de pantalla con un container
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/wallpaper.png'
            ),
            fit: BoxFit.cover,
          ),
        ),


        //configurando un children para que tenga varios hijos usando un column
        child: Column(
          // centreando el contenido
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


          ],
        ),

      ),


    );
  }


}