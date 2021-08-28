import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internet_shop/model/product.dart';
import 'package:internet_shop/model_api/base_api.dart';

//https://www.notion.so/whitetigersoft/http-JSON-94d33f25c503467fb5ccf42dadfa6df0
class ProductApi extends BaseApi {
  static Future<List<Product>> fetchProducts({
    int? categoryId,
    //TODO: add offset
  }) async {
    //TODO: add params Map. Add categoryId if not null
    //TODO: add offset to params

    //TODO: move appKey to doAbsUrl
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

  //TODO: remove
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
