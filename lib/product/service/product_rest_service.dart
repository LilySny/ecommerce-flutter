import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_mobx/exceptions/product_not_found_exception.dart';
import 'package:flutter_ecommerce_mobx/product/model/product.dart';
import 'package:flutter_ecommerce_mobx/product/service/product_service.dart';

class ProductRestService implements ProductService {
  final Dio dio;
  Map<String, dynamic> json = {
    "id": 1,
    "name": "Coffee Scented Candle",
    "price": 19.99,
    "description": "High quality scented candles.",
    "imageUrl":
        "https://i.pinimg.com/originals/3f/51/51/3f5151461caaf91c8aa902c9b59a0ad8.jpg"
  };

  ProductRestService(this.dio);

  @override
  Future<Product> findById(int id) async {
    try {
      if (id == json["id"]) return Product.fromJson(json);
      throw ProductNotFoundException("Produto não encontrado!");
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<List<Product>> findProducts() async {
    try {
      List<Product> products = [
        Product(
            id: 1,
            name: "Hello",
            description: "suahsuah",
            price: 1.300,
            imageUrl:
                "https://i.pinimg.com/originals/3f/51/51/3f5151461caaf91c8aa902c9b59a0ad8.jpg"),
        Product(
            id: 2,
            name: "Hello",
            description: "suahsuah",
            price: 1.300,
            imageUrl:
                "https://i.pinimg.com/originals/3f/51/51/3f5151461caaf91c8aa902c9b59a0ad8.jpg"),
        Product(
            id: 3,
            name: "Hello",
            description: "suahsuah",
            price: 1.300,
            imageUrl:
                "https://i.pinimg.com/originals/3f/51/51/3f5151461caaf91c8aa902c9b59a0ad8.jpg")
      ];
      return products;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
