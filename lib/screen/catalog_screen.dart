import 'package:flutter/material.dart';
import 'package:internet_shop/model/category.dart';
import 'package:internet_shop/model_api/category_api.dart';
import 'package:internet_shop/view/category_grid_item.dart';
import 'package:internet_shop/screen/products_screen.dart';

class CatalogScreen extends StatefulWidget {
  final String titleAppBar;
  final int? parentId;

  CatalogScreen({
    Key? key,
    this.titleAppBar = "Каталог",
    this.parentId,
  }) : super(key: key);

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
    List<Category> newCategories = await CategoryApi.fetchCategories(
      parentId: widget.parentId,
    );
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
      title: Text(widget.titleAppBar),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 12,
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.25,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        var category = categories[index];
        return GestureDetector(
          onTap: () => onCategoryTap(category),
          child: CategoryGridItem(category: category),
        );
      },
    );
  }

  void onCategoryTap(Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => (category.hasSubcategories == 0)
            ? ProductsScreen(
                titleAppBar: category.title,
                categoryId: category.categoryId,
              )
            : CatalogScreen(
                titleAppBar: category.title,
                parentId: category.categoryId,
              ),
      ),
    );
  }
}
