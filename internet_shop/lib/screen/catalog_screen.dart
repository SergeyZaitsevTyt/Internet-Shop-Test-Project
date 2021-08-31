import 'package:flutter/material.dart';
import 'package:internet_shop/model/category.dart';
import 'package:internet_shop/model_api/category_api.dart';
import 'package:internet_shop/screen/catalog_screen_grid_item.dart';
import 'package:internet_shop/screen/products_screen.dart';

class CatalogScreen extends StatefulWidget {
  CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    List<Category> newCategories = await CategoryApi.fetchCategories();
    setState(
      () {
        categories.addAll(newCategories);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
      backgroundColor: Colors.tealAccent,
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Каталог'),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 12,
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(30),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        var category = categories[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsScreen(
                  titleAppBar: category.title,
                  categoryId: category.categoryId,
                ),
              ),
            );
          },
          child: CategoryGridItem(category: category),
        );
      },
    );
  }
}
