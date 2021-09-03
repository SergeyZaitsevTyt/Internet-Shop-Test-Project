import 'package:flutter/material.dart';
import 'package:internet_shop/model/product.dart';
import 'package:internet_shop/extended_image/item_extended_image.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  ProductListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AspectRatio(
        aspectRatio: 16 / 9,
        child: ItemExtendedImage(
          url: product.imageUrl,
        ),
      ),
      //Image.network(product.imageUrl),
      title: Text(
        product.title,
        //(product.title.isNotEmpty || false) ? product.title : '---',
      ),
      subtitle: Text(
        product.price.toString() + ' ₽',
      ),
    );
  }
}
