class Product {
  String id;
  String name;
  double price;
  String description;

  Product({
    this.id = "",
    required this.name,
    required this.price,
    required this.description,
  });

  // Converts the Product object to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,
    };
  }
}
