import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comunidad Gamer',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: const Color.fromARGB(221, 58, 12, 103),
      ),
      body: Stack(
        children: [
          // Fondo gamer
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagen/comunidadfondo.png'), // usa el mismo fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Capa de oscurecimiento
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          // Contenido
          Center(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '💬 Últimos comentarios:',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '👾 ProGamer21: ¡Este juego es brutal!',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🎮 NoobSlayer: ¿Quién quiere jugar esta noche?',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🔥 xXDarkSoulXx: ¡Nuevo récord en el nivel 5!',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
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
