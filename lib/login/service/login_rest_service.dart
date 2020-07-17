import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_mobx/exceptions/user_not_found_exception.dart';
import 'package:flutter_ecommerce_mobx/login/dto/login_dto.dart';
import 'package:flutter_ecommerce_mobx/login/dto/login_response.dart';
import 'package:flutter_ecommerce_mobx/login/service/login_service.dart';

class LoginRestService implements LoginService {
  final Dio client;
  Map<String, dynamic> json = {
    "username": "livia@gmail.com",
    "password": "12345678"
  };

  LoginRestService(this.client);

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    try {
      if (loginDto.username == json["username"] &&
          loginDto.password == json["password"])
        return LoginResponse(
            message: "Usuário logado com sucesso!", token: "MIAAAAAAU");
      throw UserNotFoundException("Usuário não encontrado!");
    } catch (e) {
      print(e.error);
      print("Problema ao logar");
      rethrow;
    }
  }
}
