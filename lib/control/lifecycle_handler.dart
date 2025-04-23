import 'package:flutter/material.dart';
import 'package:prueba5/temporizador.dart';  // Asegúrate de que el import sea correcto

class LifecycleHandler with WidgetsBindingObserver {
  static final LifecycleHandler _instance = LifecycleHandler._internal();

  factory LifecycleHandler() {
    return _instance;
  }

  LifecycleHandler._internal();

  void init() {
    WidgetsBinding.instance.addObserver(this);
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        Temporizador.pausar(); // Pausa el temporizador cuando la app entra en segundo plano
        break;
      case AppLifecycleState.resumed:
        Temporizador.iniciar(); // Inicia el temporizador cuando la app se activa
        break;
      default:
        break;
    }
  }
}
