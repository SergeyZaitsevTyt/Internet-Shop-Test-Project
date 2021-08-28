import 'package:flutter/material.dart';
import 'package:internet_shop/view/products_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductsScreen(
        title: "Все товары",
        categoryId: -1,
      ),
      title: "Интернет магазин",
      color: Colors.blue,
    );
  }
}
