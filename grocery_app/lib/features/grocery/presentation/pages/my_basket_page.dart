import 'package:flutter/material.dart';

import '../../domain/entities/grocery_entity.dart';
import '../widgets/basket_item.dart';

class MyBasketPage extends StatelessWidget {
  List<GroceryEntity> groceries = [];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as GroceryEntity;
    groceries.add(args);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Basket'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: groceries
                  .length, // You can change this to the number of items in the basket
              itemBuilder: (context, index) {
                final grocery = groceries[index];
                return BasketItem(
                  imageUrl: grocery.imageUrl,
                  name: grocery.title,
                  price: grocery.price,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${args.price}', // Example total price, replace with your logic
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Proceed to checkout action
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.orange,
                  ),
                  child: Center(
                    child: Text(
                      'Proceed to Checkout',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
