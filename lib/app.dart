import 'package:flutter/material.dart';
import 'PortfolioScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortfolioScreen(),
    );
  }
}
