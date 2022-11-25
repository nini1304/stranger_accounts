/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcquiredCard extends StatelessWidget {
  final int serviceId;
  final int userId;
  final String profileUsername;
  final String durationLabel;
  final startDate;
  final expirationDate;

  AcquiredCard(
      {Key? key,
      required this.serviceId,
      required this.userId,
      required this.profileUsername,
      required this.durationLabel,
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
              Container(
                //espacio entre imagen y tarjeta
                margin: const EdgeInsets.all(10),
                height: 145,
                width: 145,
                
                ),
              ),
              Center(
                child: Text(
                  articleConcept,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  gamePrice,
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
          Text("Id del servicio: $serviceId"),
          Text("Id del usuario: $userId"),
          Text("Nombre de usuario: $profileUsername"),
          Text("Duración: $durationLabel"),
          Text("Fecha de inicio: $startDate"),
          Text("Fecha de expiración: $expirationDate"),
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
*/
