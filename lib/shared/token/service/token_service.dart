abstract class TokenService {
  Future<void> save(String data);

  Future<String> read();

  Future<void> delete();
}
