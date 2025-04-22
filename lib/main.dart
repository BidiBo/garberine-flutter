import 'package:flutter/material.dart';
import 'package:prueba5/Home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Garberine Launcher',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home:  HomeScreen(),
    );
  }
}
