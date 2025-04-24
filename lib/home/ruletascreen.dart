import 'package:flutter/material.dart';

class Ruletascreen extends StatelessWidget {
  const Ruletascreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo gamer
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagen/ruletafondo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Capa oscura encima del fondo
          Container(
            color: const Color.fromARGB(255, 9, 91, 146).withOpacity(0.4),
          ),
          // Contenido
          Center(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 40),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
