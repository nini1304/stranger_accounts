import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stranger_accounts/ui/widget/getId.dart';

class PlansCard extends StatefulWidget {
  const PlansCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PlansCardState createState() => _PlansCardState();
}

class _PlansCardState extends State<PlansCard> {
  List<String> items = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  String? selectedItem = '1';
  @override
  Widget build(BuildContext context) => DropdownButton<String>(
        value: selectedItem,
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: TextStyle(fontSize: 24)),
                ))
            .toList(),
        onChanged: (item) => setState((() => selectedItem = item)),
      );
}
/*
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

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
    String dropdownValue = list.first;
    return DropdownButton<String>(
      // value: days.toString() + "+" + durationLabel.toString(),
      value: "days.toString() +  + durationLabel.toString()",
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
*/
