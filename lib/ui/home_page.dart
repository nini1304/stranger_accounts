import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/PageStatus.dart';
import '../cubit/home_page_cubit.dart';
import '../cubit/home_page_state.dart';
import 'menu_lateral.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal'),
        backgroundColor: const Color(0xff252A34),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: // Build menu with icons
            Column(
          children: [
            //espacio
            const SizedBox(
              height: 0,
            ),
            //carpeta de images
            //IMAGEN PENDIENTE
            Image.network(
              "https://thumbs.dreamstime.com/b/icono-del-var%C3%B3n-del-usuario-ninguna-cara-43652345.jpg",
              width: 405,
              height: 200,
              fit: BoxFit.fill,
            ),
            //ESPACIO ENTRE IMAGEN Y BOTONES
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //boton 1
                Column(
                  children: [
                    ElevatedButton(
                      //estilo de boton
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        onPrimary: Colors.white,
                        //imagen dentro del boton
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/streaming");
                      },
                      child: Column(
                        children: [
                          Image.network(
                            "https://d500.epimg.net/cincodias/imagenes/2019/07/11/lifestyle/1562841657_226036_1562841728_noticia_normal.jpg",
                            width: 150,
                            height: 120,
                            fit: BoxFit.fill,
                          ),
                          const Text("Streaming"),
                        ],
                      ),
                    ),
                  ],
                ),
                //boton 2
                Column(
                  children: [
                    ElevatedButton(
                      //estilo de boton
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        onPrimary: Colors.white,
                        //imagen dentro del boton
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/gaming");
                      },
                      child: Column(
                        children: [
                          Image.network(
                            "https://10beasts.com/images/Consoles-Gamepads-Illustration-300x300.png",
                            width: 150,
                            height: 120,
                            fit: BoxFit.fill,
                          ),
                          const Text("Gaming"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //espacio entre botones
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //boton 1
                Column(
                  children: [
                    ElevatedButton(
                      //estilo de boton
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        onPrimary: Colors.white,
                        //imagen dentro del boton
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/music");
                      },
                      child: Column(
                        children: [
                          Image.network(
                            "https://i.insider.com/5ee8f1bd3ad8610d80629a57?width=1136&format=jpeg",
                            width: 150,
                            height: 120,
                            fit: BoxFit.fill,
                          ),
                          const Text("Music"),
                        ],
                      ),
                    ),
                  ],
                ),
                //boton 2
                Column(
                  children: [
                    ElevatedButton(
                      //estilo de boton
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        onPrimary: Colors.white,
                        //imagen dentro del boton
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/newOrder");
                      },
                      child: Column(
                        children: [
                          Image.network(
                            "https://cdn0.iconfinder.com/data/icons/web-social-and-folder-icons/512/Oyun.png",
                            width: 150,
                            height: 120,
                            fit: BoxFit.fill,
                          ),
                          const Text("Store"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
