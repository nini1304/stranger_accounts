import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stranger_accounts/ui/login.dart';
import 'package:stranger_accounts/ui/register.dart';
import 'package:stranger_accounts/ui/start.dart';


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
          '/': (context) => start(),
          // Cuando naveguemos hacia la ruta "/second", crearemos el Widget SecondScreen
          '/second': (context) => login(),
          '/third': (context) => register(),
        },


    );
  }
}

