// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticationStore on _AuthenticationStoreBase, Store {
  final _$currentUserAtom = Atom(name: '_AuthenticationStoreBase.currentUser');

  @override
  ObservableFuture<User> get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(ObservableFuture<User> value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$logoutAsyncAction = AsyncAction('_AuthenticationStoreBase.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_AuthenticationStoreBaseActionController =
      ActionController(name: '_AuthenticationStoreBase');

  @override
  void authenticate(User user) {
    final _$actionInfo = _$_AuthenticationStoreBaseActionController.startAction(
        name: '_AuthenticationStoreBase.authenticate');
    try {
      return super.authenticate(user);
    } finally {
      _$_AuthenticationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser}
    ''';
  }
}
