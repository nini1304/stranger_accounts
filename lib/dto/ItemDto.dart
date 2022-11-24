import 'package:flutter/cupertino.dart';

class ItemDto {
  final int itemId;
  final String articleConcept;
  final String gamePrice;
  final double price;
  final String picture;

  ItemDto(
      {Key? key,
      required this.price,
      required this.picture,
      required this.itemId,
      required this.articleConcept,
      required this.gamePrice});

  factory ItemDto.fromJson(Map<String, dynamic> json) {
    return ItemDto(
        price: json['price'],
        picture: json['picture'],
        itemId: json['itemId'],
        articleConcept: json['articleConcept'],
        gamePrice: json['gamePrice']);
  }
}
