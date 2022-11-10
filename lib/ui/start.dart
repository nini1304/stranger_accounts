import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class start extends StatelessWidget {

  const start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        backgroundColor: const Color(0xff252A34),
      ),
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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(

              'images/logo.png',
              width: 350,
              height: 300,
            ),

            Padding(
              padding: const EdgeInsets.all(50),
              child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.app_shortcut,
                    size: 24,
                    color: Colors.white,
                  ),
                  onPressed: () {

                  },
                  style: TextButton.styleFrom(

                      backgroundColor: Color(0xff08D9D6)),
                  label: Text("INGRESAR")
              ),

            ),

            Padding(
              padding: EdgeInsets.all(50),
              child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.add_reaction_outlined,
                    size: 24,
                    color: Colors.white,
                  ),
                  onPressed: () {

                  },
                  style: TextButton.styleFrom(

                      backgroundColor: Color(0xffFF2E63)),
                  label: Text("REGISTRARSE")
              )

            ),

          ],
        ),


      ),
    );
  }
}