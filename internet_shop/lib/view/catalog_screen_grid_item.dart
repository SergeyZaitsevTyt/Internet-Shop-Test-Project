import 'package:flutter/material.dart';
import 'package:internet_shop/model/category.dart';

//TODO: update file name
class CategoryGridItem extends StatelessWidget {
  final Category category;

  //TODO: update "," for good formatting
  CategoryGridItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //TODO: remove Expanded. Try use .fit (contain)
        //TODO: use https://api.flutter.dev/flutter/widgets/AspectRatio-class.html
        Expanded(
          //TODO: use https://pub.dev/packages/extended_image for loading image from network
          child: Image.network(category.imageUrl),
        ),
        //TODO: use Expanded
        Center(
          child: Text(category.title),
        ),
      ],
    );
  }
}
