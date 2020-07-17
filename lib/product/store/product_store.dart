import 'package:flutter_ecommerce_mobx/product/service/product_service.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  final ProductService _productService;

  _ProductStore(this._productService);

  findProducts() {
    //_productService.findProducts();
  }
}
