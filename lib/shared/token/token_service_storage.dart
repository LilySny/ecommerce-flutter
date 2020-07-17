import 'package:flutter_ecommerce_mobx/shared/token/service/token_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenServiceStorage implements TokenService {
  @override
  Future<void> delete() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove("token");
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<String> read() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString("token");
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> save(String data) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", data);
    } catch (e) {
      print(e);
    }
  }
}
