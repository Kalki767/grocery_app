import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomePage after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
          context, '/home_page'); // Replace '/home' with your route name
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/Splash_image.jpg', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          // Overlay with Text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 20),
                // Welcome text
                Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Adjust color to fit your design
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 8),
                // Main text
                Text(
                  'SPEEDY CHOW',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white, // Adjust color to fit your design
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 80), // Space from the bottom
              ],
            ),
          ),
        ],
      ),
    );
  }
}
