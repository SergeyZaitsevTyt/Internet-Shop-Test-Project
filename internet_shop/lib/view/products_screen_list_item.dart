import 'package:flutter/material.dart';
import 'package:internet_shop/model/product.dart';

//TODO: update file name
class ProductListItem extends StatelessWidget {
  final Product product;

  ProductListItem({
    Key? key,
    required this.product,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.imageUrl,
        width: 100,
      ),
      title: Text((product.title.isNotEmpty || false) ? product.title : '---'),
      subtitle: Text(product.price.toString() + ' ₽'),
    );
  }
}
