import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internet_shop/model/category.dart';
import 'package:internet_shop/model_api/base_api.dart';

class CategoryApi extends BaseApi {
  static Future<List<Category>> fetchCategories({
    int? parentId,
  }) async {
    Map<String, dynamic> params = {};
    if (parentId != null) {
      params['parentId'] = parentId.toString();
    }
    Uri absCategoryUrl = BaseApi.doAbsUrl(
      "/api/common/category/list",
      params: params,
    );
    final response = await http.get(absCategoryUrl);
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
