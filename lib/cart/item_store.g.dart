// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemStore on _ItemStore, Store {
  Computed<double> _$totalPriceComputed;

  @override
  double get totalPrice =>
      (_$totalPriceComputed ??= Computed<double>(() => super.totalPrice,
              name: '_ItemStore.totalPrice'))
          .value;

  final _$quantityAtom = Atom(name: '_ItemStore.quantity');

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$_ItemStoreActionController = ActionController(name: '_ItemStore');

  @override
  dynamic increment() {
    final _$actionInfo =
        _$_ItemStoreActionController.startAction(name: '_ItemStore.increment');
    try {
      return super.increment();
    } finally {
      _$_ItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decrement() {
    final _$actionInfo =
        _$_ItemStoreActionController.startAction(name: '_ItemStore.decrement');
    try {
      return super.decrement();
    } finally {
      _$_ItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantity: ${quantity},
totalPrice: ${totalPrice}
    ''';
  }
}
