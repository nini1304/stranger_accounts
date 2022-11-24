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
        Navigator.pushNamed(
          context,
          '/customize',
        )
      },
      child: Column(
        children: [
          Row(
            children: [
              //espacio a la izquierda (margen y texto)
              const SizedBox(
                width: 10,
              ),
              Column(
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
              Image.network(
                picture,
                width: 120,
                height: 120,
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
