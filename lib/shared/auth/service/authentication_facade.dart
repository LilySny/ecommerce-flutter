import 'package:flutter_ecommerce_mobx/login/dto/login_dto.dart';
import 'package:flutter_ecommerce_mobx/shared/user/model/user.dart';

abstract class AuthenticationFacade {
  Future<User> authenticate(LoginDto loginDto);
}
