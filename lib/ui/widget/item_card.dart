import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final int itemId;
  final String articleConcept;
  final String gamePrice;
  final double price;
  final String picture;

  // ignore: prefer_const_constructors_in_immutables
  ItemCard(
      {Key? key,
      required this.itemId,
      required this.articleConcept,
      required this.gamePrice,
      required this.price,
      required this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(picture),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Center(
                child: Text(
                  articleConcept,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "$gamePrice/$price Bs.",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Article Concept: $articleConcept"),
          Text("Game Price: $gamePrice"),
          Text("Price: $price"),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
