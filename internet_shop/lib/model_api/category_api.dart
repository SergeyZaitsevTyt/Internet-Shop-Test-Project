import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internet_shop/model/category.dart';
import 'package:internet_shop/model_api/base_api.dart';

class CategoryApi extends BaseApi {
  static Future<List<Category>> fetchCategories() async {
    final String absCategoryUrl =
        BaseApi.doAbsUrl("/common/category/list?appKey=");
    final response = await http.get(Uri.parse(absCategoryUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data']['categories']
          .map<Category>((json) => Category.fromJson(json))
          .toList();
    } else {
      throw Exception('Error');
    }
  }
}
