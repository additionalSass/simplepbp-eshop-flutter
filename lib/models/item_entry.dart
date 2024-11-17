// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  String id;
  String name;
  int price;
  int stocks;
  String description;
  dynamic recomStatusLastUpdate;
  String userUsername;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.stocks,
    required this.description,
    required this.recomStatusLastUpdate,
    required this.userUsername,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        stocks: json["stocks"],
        description: json["description"],
        recomStatusLastUpdate: json["recom_status_last_update"],
        userUsername: json["user__username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "stocks": stocks,
        "description": description,
        "recom_status_last_update": recomStatusLastUpdate,
        "user__username": userUsername,
      };
}
