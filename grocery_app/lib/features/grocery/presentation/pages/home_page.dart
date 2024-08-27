import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:grocery_app/features/grocery/presentation/bloc/grocery_bloc.dart';
import 'package:grocery_app/features/grocery/presentation/widgets/burger_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<GroceryBloc>().add(GetGroceriesEvent());
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
    // Add your search logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            'Burger',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        // Removed the settings icon
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search text field
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], // Light grey background for shading
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  context
                      .read<GroceryBloc>()
                      .add(FilterGroceryEvent(text: value));
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors
                      .transparent, // Make sure background color from BoxDecoration shows
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12, horizontal: 16), // Center text vertically
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Grid view
            Expanded(
              child: BlocBuilder<GroceryBloc, GroceryState>(
                  builder: (BuildContext context, state) {
                if (state is LoadedGroceriesState) {
                  final filteredGroceries = (state as LoadedGroceriesState)
                      .groceryEntities
                      .where((grocery) => grocery.title
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase()))
                      .toList();
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: filteredGroceries.length,
                    itemBuilder: (context, index) {
                      final grocery = filteredGroceries[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/burgerDetail',
                              arguments: GroceryEntity(
                                  id: grocery.id,
                                  title: grocery.title,
                                  imageUrl: grocery.imageUrl,
                                  rating: grocery.rating,
                                  price: grocery.price,
                                  discount: grocery.discount,
                                  description: grocery.description,
                                  options: grocery.options));
                        },
                        child: BurgerItem(
                          imageUrl: grocery.imageUrl,
                          name: grocery.title,
                          price: grocery.price,
                          rating: grocery.rating,
                          groceryEntity: grocery,
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
