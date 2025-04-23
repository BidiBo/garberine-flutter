import 'package:shared_preferences/shared_preferences.dart';

class Temporizador {
  static const String _timeKey = "tiempoJugado";
  static int _tiempoTranscurrido = 0;

  // Obtiene el tiempo almacenado de SharedPreferences
  static Future<void> obtenerTiempoGuardado() async {
    final prefs = await SharedPreferences.getInstance();
    _tiempoTranscurrido = prefs.getInt(_timeKey) ?? 0;
  }

  // Inicia el temporizador
  static Future<void> iniciar() async {
    // Obtiene el tiempo guardado antes de iniciar un nuevo temporizador
    await obtenerTiempoGuardado();

    // Lógica de inicio del temporizador (por ejemplo, usando un Timer)
    // Solo se debe incrementar el tiempo cada segundo (esto se hace con un Timer en el código real)
    _tiempoTranscurrido += 1; // Ejemplo de incremento cada segundo

    // Guardar el tiempo cada vez que el temporizador aumenta
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_timeKey, _tiempoTranscurrido);
  }

  // Detiene el temporizador y guarda el tiempo
  static Future<void> detener() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_timeKey, _tiempoTranscurrido);
  }

  // Pausa el temporizador, no incrementa el tiempo
  static Future<void> pausar() async {
    // Aquí podemos agregar lógica para pausar el temporizador si estamos usando un Timer
    // Por ahora simplemente guardamos el tiempo
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_timeKey, _tiempoTranscurrido);
  }

  // Obtiene el tiempo jugado hasta el momento
  static Future<int> obtenerTiempo() async {
    await obtenerTiempoGuardado();
    return _tiempoTranscurrido;
  }

  // Formatear el tiempo
  static String formatearTiempo(int tiempo) {
    int segundos = tiempo % 60;
    int minutos = (tiempo ~/ 60) % 60;
    int horas = (tiempo ~/ 3600);
    return '${horas.toString().padLeft(2, '0')}:${minutos.toString().padLeft(2, '0')}:${segundos.toString().padLeft(2, '0')}';
  }
}
