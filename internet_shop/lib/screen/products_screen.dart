import 'package:flutter/material.dart';
import 'package:internet_shop/model/product.dart';
import 'package:internet_shop/model_api/product_api.dart';
import 'package:internet_shop/screen/catalog_screen.dart';
import 'package:internet_shop/screen/products_screen_list_item.dart';

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
    const numElemForShow = 7;
    Map<String, dynamic> params = {'offset': products.length.toString()};
    if (widget.categoryId != null) {
      params.addAll({'categoryId': widget.categoryId.toString()});
    }
    List<Product> newProducts = await ProductApi.fetchProducts(params);
    setState(
      () {
        if (newProducts.length > numElemForShow) {
          products.addAll(newProducts.sublist(0, numElemForShow - 1));
        } else {
          products.addAll(newProducts);
        }
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
        return ProductListItem(product: product);
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

  void _scrollListener() {
    if (controller.position.atEdge) {
      setState(() {
        loadProducts();
      });
    }
  }
}
