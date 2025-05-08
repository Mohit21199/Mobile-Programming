import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item.dart';
import 'cart_provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart')),
      body: Consumer<CartProvider>(
        builder: (ctx, cartProvider, _) {
          final cart = cartProvider.cart;
          final total = cartProvider.total;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: Image.asset(
                        cart[index].imageUrl,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(cart[index].title),
                      subtitle: Text('\$${cart[index].price}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () {
                          cartProvider.removeFromCart(cart[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total: \$${total.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Checkout action
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Checkout'),
                        content: Text('Your total is \$${total.toStringAsFixed(2)}.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Checkout'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
