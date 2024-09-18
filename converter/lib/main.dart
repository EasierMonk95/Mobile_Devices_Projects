import 'package:converter/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:converter/pages/conversion_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convertidor de moneda',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: false,
      ),
      home: const SplashPage(),
    );
  }
}


