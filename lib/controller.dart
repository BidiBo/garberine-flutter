import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class GameController {
  final String packageName = 'garberine.com';

  Future<void> launchGodotGame(BuildContext context) async {
    try {
      bool isAppInstalled = await LaunchApp.isAppInstalled(
        androidPackageName: packageName,
      );

      if (isAppInstalled) {
        await LaunchApp.openApp(
          androidPackageName: packageName,
          openStore: false,
        );
      } else {
        _showError(context, 'El juego no está instalado en este dispositivo.');
      }
    } catch (e) {
      print("Error al intentar abrir la app: $e");
      _showError(context, 'Ocurrió un error al intentar abrir el juego.');
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
