import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String profilePicture;

  MenuCard(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.profilePicture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //en caso de que el dispositivo no cuente con la imagen de perfil
    //se le asigna una imagen por defecto
    ImageProvider? picture = null;
    if (profilePicture != '') {
      if (File(profilePicture).existsSync()) {
        picture = Image.file(File.fromUri(Uri.parse(profilePicture))).image;
      } else {
        picture = const NetworkImage(
            'https://cdn.icon-icons.com/icons2/1508/PNG/512/systemusers_104569.png');
      }
    }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            // ignore: sort_child_properties_last
            child: Column(
              children: [
                //verificamos si la imagen de perifl esta llegando vacia o no
                if (profilePicture != '')
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: picture!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                else
                  CircularProgressIndicator(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  firstName + ' ' + lastName,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              color: Color(0xff252A34),
            ),
          ),
          ListTile(
            title: const Text('Mi Perfil'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            title: const Text('Mis Suscripciones'),
            onTap: () {
              Navigator.pushNamed(context, '/subscriptions');
            },
          ),
          ListTile(
            title: const Text('Cerrar Sesión'),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
