import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:prueba5/temporizador.dart';  // Asegúrate de que el import sea correcto

class GameController {
  static const String packageName = 'garberine.com';

  static Future<void> launchGodotGame(BuildContext context) async {
    try {
      print(">>> Verificando si el juego está instalado...");
      bool isAppInstalled = await LaunchApp.isAppInstalled(
        androidPackageName: packageName,
      );

      if (isAppInstalled) {
        print(">>> Juego instalado. Iniciando temporizador...");
        await Temporizador.iniciar();  // Iniciar el temporizador
        print(">>> Temporizador iniciado con éxito.");

        print(">>> Abriendo el juego...");
        await LaunchApp.openApp(
          androidPackageName: packageName,
          openStore: false,
        );
        print(">>> Juego lanzado correctamente.");
      } else {
        print(">>> El juego no está instalado.");
        _showError(context, 'El juego no está instalado en este dispositivo.');
      }
    } catch (e) {
      print("❌ Error al intentar abrir la app: $e");
      _showError(context, 'Ocurrió un error al intentar abrir el juego.');
    }
  }

  static void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
