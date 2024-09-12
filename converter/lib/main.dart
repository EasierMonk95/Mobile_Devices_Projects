import 'package:converter/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:converter/pages/conversion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convertidor de moneda',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}


