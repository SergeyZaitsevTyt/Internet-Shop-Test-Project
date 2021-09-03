import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  int categoryId;
  String title;
  String imageUrl;
  int hasSubcategories;

  Category(
    this.categoryId,
    this.title,
    this.imageUrl,
    this.hasSubcategories,
  );

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
