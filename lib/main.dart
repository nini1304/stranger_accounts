import 'package:flutter/material.dart';
import 'package:stranger_accounts/ui/LoginPage.dart';
import 'package:stranger_accounts/ui/RegisterPage.dart';
import 'package:stranger_accounts/ui/RestorePassPage.dart';
import 'package:stranger_accounts/ui/StartPage.dart';
import 'package:stranger_accounts/ui/VerifyCodePage.dart';
import 'package:stranger_accounts/ui/VerifyUserPage.dart';
import 'package:stranger_accounts/ui/gaming_page.dart';
import 'package:stranger_accounts/ui/home_page.dart';
import 'package:stranger_accounts/ui/item_page.dart';
import 'package:stranger_accounts/ui/music_page.dart';
import 'package:stranger_accounts/ui/plans_page.dart';
import 'package:stranger_accounts/ui/streaming_page.dart';

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
        // Cuando naveguemos hacia la ruta "/login", crearemos el Widget SecondScreen
        '/login': (context) => LoginPage(),
        //la siguiente ruta nos dirige a la pestaña de verificar email
        '/verifyuser': (context) => VerifyUserPage(),
        //la siguiente ruta nos dirige a la pestaña de verificar codifo de verificacion
        '/verifycode': (context) => VerifyCodePage(),
        //la siguiente ruta nos dirige a la pestaña de restablecer contraseña
        '/restorepass': (context) => RestorePassPage(),
        //la siguiente ruta nos dirige a la pestaña de registro

        '/register': (context) => const RegisterPage(),
        //la siguiente ruta nos dirige al menu principal
        '/home': (context) => HomePage(),
        //la siguiente ruta nos dirige a la pagina de servicios de streaming
        '/streaming': (context) => const StreamingPage(),
        //la siguiente ruta nos dirige a la pagina de servicios de gaming
        '/gaming': (context) => const GamingPage(),
        //la siguiente ruta nos dirige a la pagina de servicios de music
        '/music': (context) => const MusicPage(),
        //la siguiente ruta nos dirige a la pagina de items
        '/items': (context) => const ItemPage(),
        //la siguiente ruta nos dirige a la pagina de personalizacion de plan
        '/customize': (context) => const PlansPage(),
      },
    );
  }
}
