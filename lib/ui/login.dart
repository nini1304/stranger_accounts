import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {

  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stranger Accounts'),
        backgroundColor: const Color(0xff472D2D),
      ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'images/wallpaper1.png'
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('Selectable text'),
              SelectionContainer.disabled(child: Text('Non-selectable text')),
              Text('Selectable text'),
            ],
          ),

        ),


    );
  }
}