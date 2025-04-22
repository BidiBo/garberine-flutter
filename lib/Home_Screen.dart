import 'package:flutter/material.dart';
import 'controller.dart';  // Importamos el controlador para gestionar el juego

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con imagen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagen/fondo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Fondo con gradiente (comentado para usar imagen, descomentar si es necesario)
          /*Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 3, 104, 172), Color.fromARGB(255, 212, 190, 178)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),*/

          // Contenido principal
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '¡Bienvenido a Garberine!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 163, 106, 106),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                
                // Botón de jugar
                ElevatedButton.icon(
                  onPressed: () => GameController.launchGodotGame(context),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('JUGAR'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 230, 197, 188),
                    foregroundColor: const Color.fromARGB(255, 20, 17, 17),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
