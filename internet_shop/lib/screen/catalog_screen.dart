import 'package:flutter/material.dart';
import 'package:internet_shop/model_api/category_api.dart';
import 'package:internet_shop/model/category.dart';
import 'package:internet_shop/screen/products_screen.dart';

class CatalogScreen extends StatefulWidget {
  CatalogScreen({Key? key}) : super(key: key);

  @override
  CatalogScreenState createState() => CatalogScreenState();
}

class CatalogScreenState extends State<CatalogScreen> {
  //late Future<List<Category>> futureCategories;
  final List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    loadCategories();
    //futureCategories = CategoryApi.fetchCategories();
  }

  Future<void> loadCategories() async {
    var newCategories = await CategoryApi.fetchCategories();
    setState(
      () {
        categories.addAll(newCategories);
      },
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Каталог'),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 12,
      ),
    );
  }

  //TODO: update building, separate tree
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: GridView.builder(
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
            //TODO: extract to CategoryGridItem(category) : StatelessWidget
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    category.imageUrl,
                  ),
                ),
                Center(
                  child: Text(category.title),
                ),
              ],
            ),
          );
        },
      ),
      backgroundColor: Colors.tealAccent,
    );
  }
}
