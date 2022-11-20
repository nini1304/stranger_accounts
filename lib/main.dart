import 'package:flutter/material.dart';
import 'package:stranger_accounts/ui/LoginPage.dart';
import 'package:stranger_accounts/ui/StartPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      // Inicie la aplicación con la ruta con nombre. En nuestro caso, la aplicación comenzará
      // en el Widget FirstScreen
      initialRoute: '/',
      routes: {
        // Cuando naveguemos hacia la ruta "/", crearemos el Widget FirstScreen
        '/': (context) => const StartPage(),
        // Cuando naveguemos hacia la ruta "/second", crearemos el Widget SecondScreen

        '/login': (context) => LoginPage(),
        // '/register': (context) => ,
      },
    );
  }
}
