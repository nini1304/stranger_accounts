// ignore: file_names
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // The Scaffold is a widget in Flutter used to implements the basic material design visual layout structure
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        backgroundColor: const Color(0xff252A34),
      ),
      // configurando el fondo de pantalla con un container
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/wallpaper.png'),
            fit: BoxFit.cover,
          ),
        ),

        //configurando un children para que tenga varios hijos usando un column
        child: ListView(
          // centreando el contenido
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //cargamos el logo
            Image.asset(
              'images/logo.png',
              width: 350,
              height: 300,
            ),
            // creamos un texto
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Ya tiene una cuenta? Inicia sesion :",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            // creamos el boton de ingresar
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.add_to_home_screen,
                    size: 24,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, '/login');
                    Navigator.pushNamed(context, '/login');
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xff08D9D6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  label: const Text(
                    "Ingresar",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )),
            ),

            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "No tiene una cuenta? Registrate :",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.account_box_outlined,
                      size: 24,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xffFF2E63),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    label: const Text(
                      "Registrarse",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
