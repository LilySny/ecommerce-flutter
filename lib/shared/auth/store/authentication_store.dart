import 'package:flutter_ecommerce_mobx/shared/token/service/token_service.dart';
import 'package:flutter_ecommerce_mobx/shared/user/model/user.dart';
import 'package:mobx/mobx.dart';

part 'authentication_store.g.dart';

class AuthenticationStore extends _AuthenticationStoreBase
    with _$AuthenticationStore {
  static AuthenticationStore _instance;

  AuthenticationStore._();

  static AuthenticationStore getInstance() {
    _instance ??= AuthenticationStore._();
    return _instance;
  }
}

abstract class _AuthenticationStoreBase with Store {
  TokenService _tokenUtils;

  @observable
  ObservableFuture<User> currentUser;

  @action
  void authenticate(User user) {
    currentUser = ObservableFuture.value(user);
    print("Usuario autenticado: " + currentUser.name);
  }

  @action
  Future<void> logout() async {
    await _tokenUtils.delete();
    currentUser = null;
  }
}
