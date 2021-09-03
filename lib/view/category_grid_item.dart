import 'package:flutter/material.dart';
import 'package:internet_shop/model/category.dart';
import 'package:internet_shop/extended_image/item_extended_image.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;

  CategoryGridItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 16 / 9,
          child: ItemExtendedImage(
            url: category.imageUrl,
          ),
        ),
        Text(
          category.title,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
