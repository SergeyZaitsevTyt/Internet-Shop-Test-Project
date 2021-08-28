import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internet_shop/model/product.dart';
import 'package:internet_shop/model_api/base_api.dart';

class ProductApi extends BaseApi {
  static Future<List<Product>> fetchProducts() async {
    String absProductUrl = BaseApi.doAbsUrl('/common/product/list?appKey=');
    final response = await http.get(Uri.parse(absProductUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data']
          .map<Product>((json) => Product.fromJson(json))
          .toList();
    } else {
      throw Exception('Error');
    }
  }

  static Future<List<Product>> fetchProductsCategory(
      String nameParameter, dynamic valueParameter) async {
    String absProductUrl = BaseApi.doAbsUrl('/common/product/list?appKey=');
    absProductUrl =
        BaseApi.addParameterInUrl(absProductUrl, nameParameter, valueParameter);

    final response = await http.get(Uri.parse(absProductUrl));
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
