import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  static const splashRoute = 'Splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Image.asset(
            'assets/telekom.png',
          ),
        ),
      ),
    );
  }
}
