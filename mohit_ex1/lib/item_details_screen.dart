import 'package:flutter/material.dart';
import 'item.dart';
import 'cart_provider.dart';
import 'package:provider/provider.dart';

class ItemDetailsScreen extends StatelessWidget {
  static const routeName = '/item-details';

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              item.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              item.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '\$${item.price}',
              style: TextStyle(fontSize: 22, color: Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              'This is a detailed description of the item. You can add more details about the item here.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Add item to cart
                Provider.of<CartProvider>(context, listen: false).addToCart(item);

                // Show snack bar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.title} added to your cart'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
