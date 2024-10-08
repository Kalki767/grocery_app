import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/grocery/presentation/bloc/grocery_bloc.dart';
import 'package:grocery_app/features/grocery/presentation/pages/burger_detail_page.dart';
import 'package:grocery_app/features/grocery/presentation/pages/my_basket_page.dart';
import 'package:grocery_app/features/grocery/presentation/pages/splash_page.dart';
import 'package:grocery_app/injection_container.dart';

import 'features/grocery/presentation/pages/home_page.dart';
// Import your BLoC here

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GroceryBloc>(
      create: (context) => sl<GroceryBloc>(), // Provide your BLoC instance here
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(),
          '/home_page': (context) => const HomePage(),
          '/burgerDetail': (context) => BurgerDetailPage(),
          '/basket_page': (context) => MyBasketPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
