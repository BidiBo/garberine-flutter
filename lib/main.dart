/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garberine Launcher',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> launchGodotGame(BuildContext context) async {
    // Solicitar permisos de almacenamiento en tiempo de ejecución
    await _requestPermissions();

    // Verificar si el permiso de almacenamiento fue concedido
    if (await Permission.storage.isGranted) {
      try {
        // Verificar si la app está instalada
        bool isAppInstalled = await LaunchApp.isAppInstalled(
            androidPackageName: 'garberine.com');
        
        if (isAppInstalled) {
          // Intentar abrir el juego instalado
          await LaunchApp.openApp(
            androidPackageName: 'garberine.com',
            openStore: false,
          );
        } else {
          print("App no instalada. Mostrando diálogo de instalación...");

          // Preguntar al usuario si desea instalarlo
          final confirm = await showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("¿Instalar Garberio?"),
              content: const Text("No se encontró el juego instalado. ¿Deseas instalarlo ahora?"),
              actions: [
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () => Navigator.pop(ctx, false),
                ),
                ElevatedButton(
                  child: const Text("Instalar"),
                  onPressed: () => Navigator.pop(ctx, true),
                ),
              ],
            ),
          );

          if (confirm == true) {
            const apkPath = '/storage/emulated/0/Download/garberio.apk';
            final Uri apkUri = Uri.parse('file://$apkPath');

            if (await File(apkPath).exists()) {
              final bool success = await launchUrl(apkUri);
              if (!success) {
                _showError(context, 'No se pudo abrir el instalador del APK.');
              }
            } else {
              _showError(context, 'APK no encontrado en la carpeta Download.');
            }
          }
        }
      } catch (e) {
        print("Error al intentar abrir la app: $e");
        _showError(context, 'Error al intentar abrir la app.');
      }
    } else {
      _showError(context, 'Permisos de almacenamiento denegados.');
      // Mostrar un mensaje para que el usuario vaya a la configuración
      _showRequestPermissionDialog(context);
    }
  }

  // Solicitar permisos de almacenamiento
  Future<void> _requestPermissions() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      print("Permisos de almacenamiento concedidos.");
    } else {
      print("Permisos de almacenamiento denegados.");
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

  // Función para mostrar un mensaje al usuario pidiendo permisos manualmente
  void _showRequestPermissionDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Permiso de Almacenamiento Denegado"),
          content: const Text("Para poder instalar el juego, necesitamos acceso al almacenamiento. Por favor, habilita los permisos desde la configuración."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings(); // Abre la configuración de la app para permisos
              },
              child: const Text("Ir a Configuración"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '¡Bienvenido a Garberine!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () => launchGodotGame(context),
              icon: const Icon(Icons.play_arrow),
              label: const Text('JUGAR'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garberine Launcher',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> launchGodotGame(BuildContext context) async {
    try {
      bool isAppInstalled = await LaunchApp.isAppInstalled(
        androidPackageName: 'garberine.com',
      );

      if (isAppInstalled) {
        await LaunchApp.openApp(
          androidPackageName: 'garberine.com',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '¡Bienvenido a Garberine!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () => launchGodotGame(context),
              icon: const Icon(Icons.play_arrow),
              label: const Text('JUGAR'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
