import 'package:flutter/material.dart';
import 'package:internet_shop/model/product.dart';
import 'package:internet_shop/view/catalog_screen.dart';
import 'package:internet_shop/api/product_api.dart';

class ProductsScreen extends StatefulWidget {
  final String title;
  final int categoryId;

  ProductsScreen({Key? key, required this.title, required this.categoryId})
      : super(key: key);

  @override
  ProductsScreenState createState() =>
      ProductsScreenState(this.title, this.categoryId);
}

class ProductsScreenState extends State<ProductsScreen> {
  late ScrollController controller;
  late Future<List<Product>> futureProducts;
  final String title;
  final int categoryId;

  ProductsScreenState(this.title, this.categoryId);
  @override
  void initState() {
    super.initState();
    if (categoryId == -1) {
      futureProducts = ProductApi.fetchProducts();
    } else {
      futureProducts =
          ProductApi.fetchProductsCategory('categoryId', categoryId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 12,
        ),
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshotProducts) {
          if (snapshotProducts.hasData) {
            return ListView.builder(
              itemCount: snapshotProducts.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Expanded(
                    child: Image.network(
                      snapshotProducts.data![index].imageUrl,
                      width: 100,
                    ),
                  ),
                  title: Text(snapshotProducts.data![index].title),
                  subtitle: Text(
                      snapshotProducts.data![index].price.toString() + ' ₽'),
                );
              },
            );
          } else {
            return Center(child: Text(snapshotProducts.error.toString()));
          }
        },
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          child: Text('Каталог'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CatalogScreen(),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: Colors.tealAccent,
    );
  }
}
