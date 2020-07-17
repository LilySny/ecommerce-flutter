// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_LoginStore.loading'))
      .value;

  final _$requestAtom = Atom(name: '_LoginStore.request');

  @override
  ObservableFuture<dynamic> get request {
    _$requestAtom.reportRead();
    return super.request;
  }

  @override
  set request(ObservableFuture<dynamic> value) {
    _$requestAtom.reportWrite(value, super.request, () {
      super.request = value;
    });
  }

  final _$usernameAtom = Atom(name: '_LoginStore.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void submit() {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.submit');
    try {
      return super.submit();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
request: ${request},
username: ${username},
password: ${password},
loading: ${loading}
    ''';
  }
}
