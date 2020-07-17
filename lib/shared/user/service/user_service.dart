
import 'package:flutter_ecommerce_mobx/shared/user/model/user.dart';

abstract class UserService {
  Future<User> findCurrentUser();
}