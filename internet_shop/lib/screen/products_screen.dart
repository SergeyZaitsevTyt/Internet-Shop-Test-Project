import 'package:flutter/material.dart';
import 'package:internet_shop/model/product.dart';
import 'package:internet_shop/model_api/product_api.dart';
import 'package:internet_shop/screen/catalog_screen.dart';

class ProductsScreen extends StatefulWidget {
  final String titleAppBar;
  final int? categoryId;

  ProductsScreen({
    Key? key,
    this.titleAppBar = "Все товары",
    this.categoryId,
  }) : super(
          key: key,
        );

  @override
  ProductsScreenState createState() => ProductsScreenState();
}

class ProductsScreenState extends State<ProductsScreen> {
  final List<Product> products = [];

//late ScrollController controller;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    var newProducts = await ProductApi.fetchProducts(
        params: {'offset': products.length, 'categoryId': widget.categoryId});
    setState(
      () {
        products.addAll(newProducts);
      },
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(widget.titleAppBar),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 12,
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    //TODO: add infinity scroll support, call loadProducts
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        var product = products[index];
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
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Text('Каталог'),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CatalogScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
      floatingActionButton: buildFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: Colors.tealAccent,
    );
  }
}
