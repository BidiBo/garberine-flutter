import 'package:flutter/material.dart';
import 'package:prueba5/temporizador.dart';
import 'package:prueba5/control/controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de imagen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagen/fondo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Oscurecimiento suave
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          // Contenido principal
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '¡Bienvenido a Garberine!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () async {
                    await Temporizador.iniciar();  // Iniciar el temporizador
                    GameController.launchGodotGame(context);
                  }, 
                  icon: const Icon(Icons.play_arrow, size: 30),
                  label: const Text(
                    'JUGAR',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 230, 197, 188),
                    foregroundColor: const Color.fromARGB(255, 20, 17, 17),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
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
