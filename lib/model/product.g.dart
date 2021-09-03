// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    json['title'] as String,
    json['price'] as int,
    json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
    };
