// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';
import 'cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        title: 'Shopping App',
        home: LoginPage(),
      ),
    );
  }
}
