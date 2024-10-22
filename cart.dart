// lib/cart.dart
import 'package:flutter/material.dart';
import 'product.dart';

class Cart with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void addItem(Product product) {
    // Check if the item already exists in the cart
    final existingProductIndex =
        _items.indexWhere((item) => item.name == product.name);
    if (existingProductIndex >= 0) {
      // If it exists, increase the quantity
      _items[existingProductIndex].quantity++;
    } else {
      // If it doesn't exist, add it to the cart with quantity 1
      product.quantity = 1; // Ensure quantity is initialized
      _items.add(product);
    }
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    // Calculate total price based on quantities
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void increaseQuantity(Product item) {
    item.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(Product item) {
    if (item.quantity > 1) {
      item.quantity--;
      notifyListeners();
    }
  }
}
