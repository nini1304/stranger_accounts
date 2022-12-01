import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcquiredCard extends StatelessWidget {
  final int serviceId;
  final String serviceName;
  final int userId;
  final String profileUsername;
  final String durationLabel;
  final String picture;
  final startDate;
  final expirationDate;
//  const AcquiredCard({super.key});

  AcquiredCard(
      {Key? key,
      required this.serviceId,
      required this.serviceName,
      required this.userId,
      required this.profileUsername,
      required this.durationLabel,
      required this.picture,
      required this.startDate,
      required this.expirationDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              showDialog(
                  context: context,
                  builder: (context) => _buildPopupDialog(context))
            },
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Servicio:" + serviceName.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  "Plan:" + durationLabel,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Información de la compra'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Id del servicio:" + serviceId.toString()),
          Text("Id del usuario:" + userId.toString()),
          Text("Nombre de usuario:" + profileUsername),
          Text("Duración:" + durationLabel),
          Text("Fecha de inicio:" + startDate.toString()),
          Text("Fecha de expiración:" + expirationDate.toString()),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cerrar'),
        ),
      ],
    );
  }
}
