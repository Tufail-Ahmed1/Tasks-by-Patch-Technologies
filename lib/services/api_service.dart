import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:patchtest/models/product.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com/products?limit=50';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
