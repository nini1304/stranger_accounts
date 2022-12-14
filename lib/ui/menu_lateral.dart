import 'package:flutter/material.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({super.key});

  @override
  // ignore: library_private_types_in_public_api
  State<MenuLateral> createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://thumbs.dreamstime.com/b/icono-del-var%C3%B3n-del-usuario-ninguna-cara-43652345.jpg"),
                fit: BoxFit.scaleDown,
              ),
              shape: BoxShape.circle,
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(5.0, 5.0),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: Text(''),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(0),
          ),
          Text(
            'Bienvenido',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Servicios adquiridos'),
            onTap: () {
              Navigator.pushNamed(context, '/acquired');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cerrar sesión'),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/', (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
