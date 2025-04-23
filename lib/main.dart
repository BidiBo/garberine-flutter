

import 'package:flutter/material.dart';
import 'main_screen.dart';

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
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MainScreen(),
    );
  }
}
