import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internet_shop/model/product.dart';
import 'package:internet_shop/model_api/base_api.dart';

class ProductApi extends BaseApi {
  static Future<List<Product>> fetchProducts(
      Map<String, dynamic> params) async {
    Uri absProductUrl = BaseApi.doAbsUrl('/api/common/product/list', params);

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
