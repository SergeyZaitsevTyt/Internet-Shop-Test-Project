import 'package:flutter/material.dart';
import 'package:internet_shop/model/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;

  CategoryGridItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Image.network(category.imageUrl),
        ),
        Center(
          child: Text(category.title),
        ),
      ],
    );
  }
}
