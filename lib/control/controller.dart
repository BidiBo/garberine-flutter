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
        await LaunchApp.openApp(
          androidPackageName: packageName,
          openStore: false,
        );
      } else {
        _showError(context, 'El juego no está instalado en este dispositivo.');
      }
    } catch (e) {
      _showError(context, 'Ocurrió un error al intentar abrir el juego.');
    }
  }

  static void _showError(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }
}
