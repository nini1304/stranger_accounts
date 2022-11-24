// ignore_for_file: unnecessary_import, implementation_imports, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StreamingCard extends StatelessWidget {
  final int serviceId;
  final String platformName;
  final String planPrice;
  final String picture;

  // ignore: prefer_const_constructors_in_immutables
  StreamingCard(
      {Key? key,
      required this.serviceId,
      required this.platformName,
      required this.planPrice,
      required this.picture})
      : super(key: key);

//se crea el widget que se va a mostrar en la pantalla
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, '/login'),
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      platformName,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      planPrice,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                  //alineamos los elementos de la columna a la izquierda
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                width: 220,
                height: 45,
                //decoracion del contenedor
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 8,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
              //definimos el espacio entre las columnas
              const SizedBox(
                width: 15,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Image.network(
                  picture,
                  width: 100,
                  height: 100,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Color(0xFF000000)),
                    left: BorderSide(width: 1.0, color: Color(0xFF000000)),
                    right: BorderSide(width: 1.0, color: Color(0xFF000000)),
                    bottom: BorderSide(width: 1.0, color: Color(0xFF000000)),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            height: 5,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
        ],
      ),
    );
  }
}
