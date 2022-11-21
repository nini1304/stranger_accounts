import 'package:flutter/material.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  State<MenuLateral> createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
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
            'Usuario',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Nuevo Pedido'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Pedidos anteriores'),
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text('Mis facturas'),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Salir'),
          ),
        ],
      ),
    );
  }
}
