class ProductNotFoundException implements Exception {
  final String message;

  ProductNotFoundException(this.message);
}
