import 'package:flutter/material.dart';
import 'package:prueba5/temporizador.dart';  // Asegúrate de que el import sea correcto

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: FutureBuilder<int>(
          future: Temporizador.obtenerTiempo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              final tiempoJugado = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tiempo jugado:',
                    style: TextStyle(fontSize: 24, color: Colors.orangeAccent),
                  ),
                  Text(
                    '${Temporizador.formatearTiempo(tiempoJugado)}', // Mostrar el tiempo formateado
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            } else {
              return const Text(
                'No se pudo obtener el tiempo',
                style: TextStyle(fontSize: 20, color: Colors.red),
              );
            }
          },
        ),
      ),
    );
  }
}
