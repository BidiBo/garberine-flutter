import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Noticias Gamer',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      ),
      body: Stack(
        children: [
          // Fondo gamer
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagen/noticiasfondo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Oscurecer un poco
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Contenido
          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 194, 99, 99).withOpacity(0.7),
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
                      '📰 Últimas Noticias',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '🎮 ¡Nuevo DLC anunciado para BattleZone 3!',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '⚔️ Torneo de eSports arranca este fin de semana con premios increíbles.',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '🚀 El juego “Galaxy Blitz” se actualiza con nuevos mapas y armas.',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
