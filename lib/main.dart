import 'package:cruchshop/screens/splash_screen.dart';
import 'package:cruchshop/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crunch Shop',
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}
