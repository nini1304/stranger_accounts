import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {

  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Stranger Accounts'),
        backgroundColor: Color(0xff472D2D),
      ),
        body: Container(
          decoration: BoxDecoration(
           image: DecorationImage(
              image: AssetImage(
                  'images/wallpaper1.png'
              ),
            ),
          ) ,

        ),


    );
  }
}