import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'cart_screen.dart';
import 'item_details_screen.dart';
import 'cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bike Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        CartScreen.routeName: (context) => CartScreen(),
        ItemDetailsScreen.routeName: (context) => ItemDetailsScreen(),
      },
    );
  }
}
