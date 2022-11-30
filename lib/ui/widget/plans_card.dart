import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlansCard extends StatelessWidget {
  final int plansId;
  final int days;
  final double price;
  final String durationLabel;
  final int serviceId;

  // ignore: prefer_const_constructors_in_immutables
  PlansCard(
      {Key? key,
      required this.plansId,
      required this.days,
      required this.price,
      required this.durationLabel,
      required this.serviceId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, '/customize'),
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
                // ignore: sort_child_properties_last
                children: [
                  Text(
                    "Duracion: $days dias",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    price.toString(),
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Plan: $durationLabel",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
                //alineamos los elementos de la columna a la izquierda
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              //definimos el espacio entre las columnas
              const SizedBox(
                width: 100,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Image.network(
                  "https://thumbs.dreamstime.com/b/icono-de-planificaci%C3%B3n-tiempo-administraci%C3%B3n-programaci%C3%B3n-plan-hermoso-meticulosamente-utilizado-por-el-negocios-para-cualquier-161286039.jpg",
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

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       Container(
  //         width: 300,
  //         height: 100,
  //         decoration: BoxDecoration(
  //           color: const Color(0xff1a1a1a),
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         child: Row(
  //           children: [
  //             Container(
  //               width: 100,
  //               height: 100,
  //               decoration: BoxDecoration(
  //                 color: const Color(0xff1a1a1a),
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               child: Column(
  //                 children: [
  //                   Container(
  //                     width: 100,
  //                     height: 50,
  //                     decoration: BoxDecoration(
  //                       color: const Color(0xff1a1a1a),
  //                       borderRadius: BorderRadius.circular(10),
  //                     ),
  //                     child: Center(
  //                       child: Text(
  //                         days.toString(),
  //                         style: const TextStyle(
  //                           color: Color(0xffe5e5e5),
  //                           fontSize: 30,
  //                           fontWeight: FontWeight.w700,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     width: 100,
  //                     height: 50,
  //                     decoration: BoxDecoration(
  //                       color: const Color(0xff1a1a1a),
  //                       borderRadius: BorderRadius.circular(10),
  //                     ),
  //                     child: Center(
  //                       child: Text(
  //                         durationLabel,
  //                         style: const TextStyle(
  //                           color: Color(0xffe5e5e5),
  //                           fontSize: 15,
  //                           fontWeight: FontWeight.w700,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               width: 200,
  //               height: 100,
  //               decoration: BoxDecoration(
  //                 color: const Color(0xff1a1a1a),
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               child: Column(
  //                 children: [
  //                   Container(
  //                     width: 200,
  //                     height: 50,
  //                     decoration: BoxDecoration(
  //                       color: const Color(0xff1a1a1a),
  //                       borderRadius: BorderRadius.circular(10),
  //                     ),
  //                     child: Center(
  //                       child: Text(
  //                         '\$ $price',
  //                         style: const TextStyle(
  //                           color: Color(0xffe5e5e5),
  //                           fontSize: 30,
  //                           fontWeight: FontWeight.w700,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     width: 200,
  //                     height: 50,
  //                     decoration: BoxDecoration(
  //                       color: const Color(0x000000ff),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
