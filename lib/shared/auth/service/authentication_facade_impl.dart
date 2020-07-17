import 'package:flutter_ecommerce_mobx/login/dto/login_dto.dart';
import 'package:flutter_ecommerce_mobx/login/service/login_service.dart';
import 'package:flutter_ecommerce_mobx/shared/auth/service/authentication_facade.dart';
import 'package:flutter_ecommerce_mobx/shared/token/service/token_service.dart';
import 'package:flutter_ecommerce_mobx/shared/user/model/user.dart';
import 'package:flutter_ecommerce_mobx/shared/user/service/user_service.dart';

class AuthenticationFacadeImpl implements AuthenticationFacade {
  final LoginService _loginService;
  final UserService _userService;
  final TokenService _tokenService;

  AuthenticationFacadeImpl(
      this._loginService, this._userService, this._tokenService);

  @override
  Future<User> authenticate(LoginDto loginDto) async {
    try {
      print("Init Auth Facade");
      final login = await _loginService.login(loginDto);
      print("Logged in");
      await _tokenService.save(login.token);
      print("Saved token");
      return await _userService.findCurrentUser();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
