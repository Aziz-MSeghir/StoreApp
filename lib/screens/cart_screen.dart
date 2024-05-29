// cart_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          final product = cartProvider.cartItems[index];
          return ListTile(
            title: Text(product.title),
            subtitle: Text('\$${product.price}'),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () {
                cartProvider.removeFromCart(product as int);
              },
            ),
          );
        },
      ),
      floatingActionButton: OutlinedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Checkout not implemented yet')),
          );
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          side: BorderSide.none,
          shape: const BeveledRectangleBorder(),
        ),
        child: const Icon(Icons.check),
      ),
    );
  }
}
