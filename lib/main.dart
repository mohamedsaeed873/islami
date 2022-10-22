import 'package:flutter/material.dart';
import 'package:islami/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home:  const SplashScreen(),
    );
  }
}