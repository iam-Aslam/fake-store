import 'package:fakestore/constants/urls.dart';
import 'package:fakestore/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class ProductProvider extends ChangeNotifier {
  Dio dio = Dio();
  List<Product> _products = [];
  bool isLoading = false;
  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    isLoading = true;
    try {
      final response = await dio.get(AppUrls.endPoint);
      if (response.statusCode == 200) {
        isLoading = false;
        final List<dynamic> data = response.data;
        _products = data.map((json) => Product.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Failed to load products: $error');
    }
  }
}
