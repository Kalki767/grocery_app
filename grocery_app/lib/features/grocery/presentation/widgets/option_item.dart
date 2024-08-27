import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  final String title;
  final String price;

  const OptionItem({required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Text(
          price,
          style: TextStyle(color: Colors.grey),
        ),
        Checkbox(value: false, onChanged: (bool? value) {}),
      ],
    );
  }
}
