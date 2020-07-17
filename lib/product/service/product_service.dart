import 'package:flutter_ecommerce_mobx/product/model/product.dart';

abstract class ProductService {
  Future<List<Product>> findProducts();
  Future<Product> findById(int id);
}
