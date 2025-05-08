import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item.dart';
import 'cart_screen.dart';
import 'cart_provider.dart';
import 'item_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Item> items = [
    Item(id: '1', title: 'Mountain Bike', price: 500.0, imageUrl: 'assets/images/bike1.png'),
    Item(id: '2', title: 'Road Bike', price: 600.0, imageUrl: 'assets/images/bike2.png'),
    Item(id: '3', title: 'Hybrid Bike', price: 450.0, imageUrl: 'assets/images/bike3.png'),
  ];

  void _addToCart(BuildContext context, Item item) {
    Provider.of<CartProvider>(context, listen: false).addToCart(item);

    // Show the "Item Added to Your Cart" message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.title} added to your cart'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _navigateToItemDetails(BuildContext context, Item item) {
    Navigator.of(context).pushNamed(
      ItemDetailsScreen.routeName,
      arguments: item, // Pass the selected item to the ItemDetailsScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bike Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () => _navigateToItemDetails(context, items[index]),
              child: Column(
                children: [
                  Image.asset(
                    items[index].imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      items[index].title,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Text('\$${items[index].price}'),
                  ElevatedButton(
                    onPressed: () {
                      _addToCart(context, items[index]);
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
