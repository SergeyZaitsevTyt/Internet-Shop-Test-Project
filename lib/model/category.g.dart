// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    json['categoryId'] as int,
    json['title'] as String,
    json['imageUrl'] as String,
    json['hasSubcategories'] as int,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'categoryId': instance.categoryId,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'hasSubcategories': instance.hasSubcategories,
    };
