class Product {
  Product({this.id, this.name, this.price, this.description, this.imageUrl});

  int id;
  String name;
  double price;
  String description;
  String imageUrl;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json["id"],
      name: json["name"],
      price: json["price"].toDouble(),
      description: json["description"],
      imageUrl: json["imageUrl"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "imageUrl": imageUrl
      };
}
