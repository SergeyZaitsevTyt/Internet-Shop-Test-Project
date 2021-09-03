import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internet_shop/model/product.dart';
import 'package:internet_shop/model_api/base_api.dart';

class ProductApi extends BaseApi {
  static Future<List<Product>> fetchProducts({
    int offset = 0,
    int? categoryId,
  }) async {
    Map<String, dynamic> params = {
      'offset': offset.toString(),
    };
    if (categoryId != null) {
      params['categoryId'] = categoryId.toString();
    }
    var absProductUrl = BaseApi.doAbsUrl(
      '/api/common/product/list',
      params: params,
    );
    final response = await http.get(absProductUrl);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data']
          .map<Product>((json) => Product.fromJson(json))
          .toList();
    } else {
      throw Exception('Error');
    }
  }
}
