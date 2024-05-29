// cart_provider.dart
import 'package:flutter/material.dart';
import 'package:store/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> product) {
    _cartItems.add(product as CartItem);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

// class CartProvider with ChangeNotifier {
//   final List<Product> _products = [];

//   List<Product> get products => _products;

//   void addProduct(Product product) {
//     _products.add(product);
//     notifyListeners();
//   }

//   void removeProduct(Product product) {
//     _products.remove(product);
//     notifyListeners();
//   }

//   double getTotalPrice() {
//     double total = 0.0;
//     for (final product in _products) {
//       total += product.price;
//     }
//     return total;
//   }
// }
