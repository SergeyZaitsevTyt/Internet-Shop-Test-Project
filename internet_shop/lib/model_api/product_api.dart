import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internet_shop/model/product.dart';
import 'package:internet_shop/model_api/base_api.dart';

//https://www.notion.so/whitetigersoft/http-JSON-94d33f25c503467fb5ccf42dadfa6df0
class ProductApi extends BaseApi {
  static Future<List<Product>> fetchProducts({
    Map<String, dynamic> params = const {'offset': int, 'categoryId': int},
  }) async {
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
