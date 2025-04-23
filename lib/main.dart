

import 'package:flutter/material.dart';
import 'package:prueba5/control/lifecycle_handler.dart';
import 'main_screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized(); // Necesario para el observer
  LifecycleHandler().init(); // Activar el observador {
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
