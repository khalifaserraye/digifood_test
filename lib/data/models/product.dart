class Product {
  String? id; // Make id field optional
  String name;
  double price;
  String description;

  Product(
      {this.id,
      required this.name,
      required this.price,
      required this.description});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,
    };
  }
}
