import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/providers/cart_provider.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // watch (getter) : accéder au product stocké dans ProductProvider
    Product? product = context.watch<ProductProvider>().product;

    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                product!.image,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          product.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        Text(
          '${product.price.toStringAsFixed(2)}€',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        RatingStars(
          value: product.rating['rate'],
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<CartProvider>(context, listen: false)
                .addToCart(product as Map<String, dynamic>);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Product added to cart')),
            );
          },
          child: const Text('Add to cart'),
        )
      ],
    );
  }
}
