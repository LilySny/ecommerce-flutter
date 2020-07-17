import 'package:flutter_ecommerce_mobx/login/dto/login_dto.dart';
import 'package:flutter_ecommerce_mobx/shared/auth/service/authentication_facade.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final AuthenticationFacade _authenticationFacade;
  _LoginStore(this._authenticationFacade);

  @observable
  ObservableFuture request = ObservableFuture.value(null);

  @computed
  bool get loading => request.status == FutureStatus.pending;

  @observable
  String username;

  @observable
  String password;

  @action
  void submit() {
    try {
      request = _authenticationFacade
          .authenticate(LoginDto(username: username, password: password))
          .asObservable()
          .then((value) => Future.delayed(Duration(seconds: 3)));
    } catch (e) {
      print(e);
    }
  }
}
