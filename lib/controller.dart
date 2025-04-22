import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class GameController {
  static const String packageName = 'garberine.com';

  static Future<void> launchGodotGame(BuildContext context) async {
    try {
      bool isAppInstalled = await LaunchApp.isAppInstalled(
        androidPackageName: packageName,
      );

      if (isAppInstalled) {
        // Intentamos abrir la app
        await LaunchApp.openApp(
          androidPackageName: packageName,
          openStore: false,
        );
      } else {
        // Si la app no está instalada, mostramos un error
        _showError(context, 'El juego no está instalado en este dispositivo.');
      }
    } catch (e) {
      // Si ocurre algún error, mostramos un mensaje de error
      print("Error al intentar abrir la app: $e");
      _showError(context, 'Ocurrió un error al intentar abrir el juego.');
    }
  }

  static void _showError(BuildContext context, String message) {
    // Mostramos un mensaje de error al usuario
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
