// ignore_for_file: unnecessary_import, implementation_imports

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
              Column(
                // ignore: sort_child_properties_last
                children: [
                  Text(
                    platformName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    planPrice,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
                //alineamos los elementos de la columna a la izquierda
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              //definimos el espacio entre las columnas
              const SizedBox(
                width: 50,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Image.network(
                  picture,
                  width: 110,
                  height: 110,
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            height: 20,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
        ],
      ),
    );
  }
}
