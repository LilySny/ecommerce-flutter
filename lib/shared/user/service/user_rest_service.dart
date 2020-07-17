import 'dart:convert';

import 'package:flutter_ecommerce_mobx/shared/user/model/user.dart';
import 'package:flutter_ecommerce_mobx/shared/user/service/user_service.dart';

class UserRestService implements UserService {
  Map<String, dynamic> json = {
    "id": 1,
    "username": "livia@gmail.com",
  };

  @override
  Future<User> findCurrentUser() async {
    try {
      return User.fromJson(json);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
