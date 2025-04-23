import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ranking de Jugadores',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: const Color.fromARGB(221, 9, 68, 95),
      ),
      body: Stack(
        children: [
          // Fondo gamer
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagen/gamerfondo.png'),
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
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.5), // Más claro
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '1. el profe - 1500 pts',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(color: Colors.white70),
                      Text(
                        '2. yo - 1450 pts',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(color: Colors.white70),
                      Text(
                        '3. yo pro - 1400 pts',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(color: Colors.white70),
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
