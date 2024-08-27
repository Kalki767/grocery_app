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
        backgroundColor: Colors.white, // Changed background color to white
        elevation: 0, // Removed shadow for a cleaner look
        title: Center(
          child: Text(
            'Burger',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Changed text color to black for contrast
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.settings, color: Colors.black),
              onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search text field
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
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
