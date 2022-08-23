import 'dart:convert';
import 'package:ecommerce_concept/data/models/cart_model/cart_model.dart';
import 'package:ecommerce_concept/data/models/categories_model/categories_model.dart';
import 'package:ecommerce_concept/data/models/product_details_model/product_details_model.dart';
import 'package:http/http.dart' as http;

class API {
  static const String _baseUrl = 'https://run.mocky.io/v3';
  late http.Response response;

  // Future<M> get<M>(String url) async {
  //   response = await http.get(
  //     Uri.parse("$_baseUrl/$url"),
  //   );
  //   if (response.statusCode == 200) {
  //     return M.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception("Failed");
  //   }
  // }

  Future<CategoriesModel> getCategories() async {
    response = await http.get(
      Uri.parse('$_baseUrl/654bd15e-b121-49ba-a588-960956b15175'),
    );

    if (response.statusCode == 200) {
      return CategoriesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  Future<ProductDetailsModel> getProductDetails() async {
    response = await http.get(
      Uri.parse('$_baseUrl/6c14c560-15c6-4248-b9d2-b4508df7d4f5'),
    );

    if (response.statusCode == 200) {
      return ProductDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  Future<CartModel> getCart() async {
    response = await http.get(
      Uri.parse('$_baseUrl/53539a72-3c5f-4f30-bbb1-6ca10d42c149'),
    );

    if (response.statusCode == 200) {
      return CartModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
