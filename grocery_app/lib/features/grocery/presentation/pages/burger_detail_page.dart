import 'package:flutter/material.dart';
import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:grocery_app/features/grocery/presentation/widgets/option_item.dart';

class BurgerDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as GroceryEntity;
    return Scaffold(
      body: Stack(
        children: [
          // Main Content with Image and Details
          SingleChildScrollView(
            //
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Background Image
                Center(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(12)),
                    child: Image.network(
                      args.imageUrl,
                      width: MediaQuery.of(context).size.width, // Full width
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        args.title,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '\$${args.discount}',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '\$${args.price}',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 24),
                          SizedBox(width: 4),
                          Text('${args.rating}',
                              style: TextStyle(fontSize: 16)),
                          SizedBox(width: 4),
                          Text('(1,205)', style: TextStyle(color: Colors.grey)),
                          Spacer(),
                          Text('See all reviews',
                              style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'A delicious chicken burger served on a toasted bun with fresh lettuce, tomato slices, and mayonnaise. Juicy grilled chicken patty seasoned to perfection.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Additional Options:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true, // Adjust size based on content
                            physics:
                                NeverScrollableScrollPhysics(), // Disable internal scrolling
                            itemCount: args.options.length,
                            itemBuilder: (context, index) {
                              return OptionItem(
                                title: args.options[index].name,
                                price: '+ £${args.options[index].price}',
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {},
                          ),
                          Text('1', style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {},
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/basket_page',
                                  arguments: GroceryEntity(
                                      id: args.id,
                                      title: args.title,
                                      imageUrl: args.imageUrl,
                                      rating: args.rating,
                                      price: args.price,
                                      discount: args.discount,
                                      description: args.description,
                                      options: args.options));
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.orange,
                            ),
                            child: Text('Add to Basket'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Back Arrow
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
