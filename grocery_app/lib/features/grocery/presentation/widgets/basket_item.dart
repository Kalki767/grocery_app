import 'package:flutter/material.dart';

class BasketItem extends StatelessWidget {
  final String imageUrl;
  final String name;

  final num price;

  const BasketItem(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '\$$price',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  // Remove item from basket
                },
              ),
              Text('1', style: TextStyle(fontSize: 18)),
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {
                  // Add item to basket
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
