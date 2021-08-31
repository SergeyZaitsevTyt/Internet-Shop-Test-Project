import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  String title;
  int price;
  String imageUrl;

  Product(
    this.title,
    this.price,
    this.imageUrl,
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
//https://www.notion.so/whitetigersoft/JSON-1a338ec1b8d1494b869d68fbef8a06bd
}
