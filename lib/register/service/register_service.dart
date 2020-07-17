import 'package:flutter_ecommerce_mobx/register/dto/register_dto.dart';

abstract class RegisterService {
  Future<void> register(RegisterDto createUserDto);
}