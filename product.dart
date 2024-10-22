// lib/product.dart
class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
    this.quantity = 0,
  });
}
