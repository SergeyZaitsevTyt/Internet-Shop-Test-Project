import 'package:flutter/material.dart';
import 'package:internet_shop/model/product.dart';
import 'package:internet_shop/model_api/product_api.dart';
import 'package:internet_shop/view/catalog_screen.dart';

class ProductsScreen extends StatefulWidget {
  final String title;
  final int? categoryId;

  ProductsScreen({
    Key? key,
    this.title = "Все товары",
    this.categoryId,
  }) : super(
          key: key,
        );

  @override
  ProductsScreenState createState() => ProductsScreenState();
}

class ProductsScreenState extends State<ProductsScreen> {
  late ScrollController controller;
  late Future<List<Product>> futureProducts;

  final List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    // if (widget.categoryId == null) {
    //   futureProducts = ProductApi.fetchProducts(
    //     categoryId: widget.categoryId,
    //   );
    // }
    loadProducts();
  }

  Future<void> loadProducts() async {
    //TODO: await ProductApi.fetchProducts(offset: _products.length)
    var newProducts = await ProductApi.fetchProducts(
      categoryId: widget.categoryId,
    );
    setState(() {
      _products.addAll(newProducts);
    });
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 12,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      //TODO: extract to buildBody
      body: FutureBuilder<List<Product>>(
        //TODO: remove FutureBuilder
        future: futureProducts,
        builder: (context, snapshotProducts) {
          if (snapshotProducts.hasData) {
            //TODO: add infinity scroll support, call loadProducts
            return ListView.builder(
              //TODO: use _products
              itemCount: snapshotProducts.data!.length,
              itemBuilder: (context, index) {
                //TODO: use _products
                var product = snapshotProducts.data![index];
                //TODO: buildProductListItem or extract to StatelessWidget ProductListItem(product)
                return ListTile(
                  leading: Expanded(
                    child: Image.network(
                      product.imageUrl,
                      width: 100,
                    ),
                  ),
                  title: Text(product.title),
                  subtitle: Text(product.price.toString() + ' ₽'),
                );
              },
            );
          } else {
            return Center(child: Text(snapshotProducts.error.toString()));
          }
        },
      ),
      //TODO: buildFloatingButton
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
