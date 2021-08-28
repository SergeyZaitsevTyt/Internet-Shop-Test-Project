import 'package:flutter/material.dart';
import 'package:internet_shop/model_api/category_api.dart';
import 'package:internet_shop/model/category.dart';
import 'package:internet_shop/view/products_screen.dart';

class CatalogScreen extends StatefulWidget {
  CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<CatalogScreen> {
  late Future<List<Category>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = CategoryApi.fetchCategories();
  }

  //TODO: update building, separate tree
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Каталог'),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 12,
          )),
      body: FutureBuilder<List<Category>>(
        future: futureCategories,
        builder: (context, snapshotCategories) {
          if (snapshotCategories.hasData) {
            return GridView.builder(
              padding: EdgeInsets.all(30),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshotCategories.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsScreen(
                          title: snapshotCategories.data![index].title,
                          categoryId:
                              snapshotCategories.data![index].categoryId,
                        ),
                      ),
                    );
                  },
                  //TODO: extract to CategoryGridItem(category) : StatelessWidget
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.network(
                          snapshotCategories.data![index].imageUrl,
                        ),
                      ),
                      Center(
                        child: Text(snapshotCategories.data![index].title),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text(snapshotCategories.error.toString()));
          }
        },
      ),
      backgroundColor: Colors.tealAccent,
    );
  }
}
