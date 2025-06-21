import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SaveLocal {
  static Future<bool> setItem(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    // Obtener datos existentes
    final existingData = await getItem(key);
    List<dynamic> dataArray;

    if (existingData != null) {
      // Si ya existen datos, verificar si es una lista
      if (existingData is List) {
        dataArray = List<dynamic>.from(existingData);
      } else {
        // Si no es una lista, convertir el dato existente en el primer elemento
        dataArray = [existingData];
      }
      // Agregar el nuevo valor al arreglo
      dataArray.add(value);
    } else {
      // Si no hay datos existentes, crear un nuevo arreglo con el valor
      dataArray = [value];
    }

    final jsonString = json.encode(dataArray);
    return await prefs.setString(key, jsonString);
  }

  static Future<dynamic> getItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    print(jsonString);
    return jsonString != null ? json.decode(jsonString) : null;
  }

  static Future<void> removeItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
