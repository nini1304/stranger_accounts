// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamingCard extends StatelessWidget {
  final int serviceId;
  final String platformName;
  final String planPrice;
  final String picture;

  // ignore: prefer_const_constructors_in_immutables
  GamingCard(
      {Key? key,
      required this.serviceId,
      required this.platformName,
      required this.planPrice,
      required this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              //definimos el espacio entre las columnas
              const SizedBox(
                width: 60,
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
