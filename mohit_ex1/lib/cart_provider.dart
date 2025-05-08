import 'package:flutter/material.dart';
import 'item.dart';

class CartProvider with ChangeNotifier {
  List<Item> _cart = [];

  List<Item> get cart => _cart;

  double get total {
    double total = 0.0;
    _cart.forEach((item) {
      total += item.price;
    });
    return total;
  }

  void addToCart(Item item) {
    _cart.add(item);
    notifyListeners(); // Notify listeners to update the UI
  }

  void removeFromCart(Item item) {
    _cart.remove(item);
    notifyListeners(); // Notify listeners to update the UI
  }
}
