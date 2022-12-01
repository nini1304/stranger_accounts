/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlansCard extends StatelessWidget {
  final int plansId;
  final int days;
  final double price;
  final String durationLabel;
  final int serviceId;

  const PlansCard(
      {Key? key,
      required this.plansId,
      required this.days,
      required this.price,
      required this.durationLabel,
      required this.serviceId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String aux = '$days' + '$price' + '$durationLabel';
    int _value = 1;
    String profilename = "";

    final _formKey = GlobalKey<FormState>();
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/wallpaper.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0xffB2B2B2),
                width: 4,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  TextFormField(
                    //decorando el textfield

                    decoration: const InputDecoration(
                      labelText: 'Nombre de Perfil de usuario',
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                    //validando el textfield
                    onSaved: (value) {
                      profilename = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor ingrese un usuario';
                      }
                    },
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          aux,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Radio(
                          value: plansId,
                          groupValue: _value,
                          activeColor: Color(0xFF6200EE),
                          onChanged: (value) {
                            _value = value as int;
                          },
                        ),
                      ),
                    ],
                  )
                ])),
          )
        ]));
  }
}*/
