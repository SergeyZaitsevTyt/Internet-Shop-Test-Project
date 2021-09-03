import 'package:flutter/material.dart';
import 'package:internet_shop/model/product.dart';
import 'package:internet_shop/model_api/product_api.dart';
import 'package:internet_shop/screen/catalog_screen.dart';
import 'package:internet_shop/view/product_list_item.dart';

class ProductsScreen extends StatefulWidget {
  final String titleAppBar;
  final int? categoryId;

  ProductsScreen({
    Key? key,
    this.titleAppBar = "Все товары",
    this.categoryId,
  }) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<Product> products = [];

  late ScrollController controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    loadProducts();
    controller.addListener(_scrollListener);
  }

  Future<void> loadProducts() async {
    var newProducts = await ProductApi.fetchProducts(
      offset: products.length,
      categoryId: widget.categoryId,
    );
    setState(() {
      products.addAll(newProducts);
    });
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
    return ListView.builder(
      itemCount: products.length,
      controller: controller,
      itemBuilder: (context, index) {
        Product product = products[index];
        return ProductListItem(
          product: product,
        );
      },
    );
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        child: Text(
          'Каталог',
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CatalogScreen(),
            ),
          );
        },
      ),
    );
  }

  void _scrollListener() {
    if (controller.position.pixels >
        controller.position.maxScrollExtent - 100) {
      loadProducts();
    }
  }
}
