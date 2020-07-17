import 'package:flutter_ecommerce_mobx/product/model/product.dart';
import 'package:mobx/mobx.dart';

part 'item_store.g.dart';

class ItemStore = _ItemStore with _$ItemStore;

abstract class _ItemStore with Store {
  final Product _product;

  _ItemStore(this._product);

  @observable
  int quantity = 1;

  @computed
  double get totalPrice => quantity * _product.price;

  @action
  increment() => quantity++;

  @action
  decrement() => quantity--;
}
