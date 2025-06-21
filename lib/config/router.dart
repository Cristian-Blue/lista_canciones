import 'package:lista_canciones/presentation/screens/screens.dart';
import 'package:lista_canciones/presentation/screens/songs/songs_screen.dart';

List<Map<String, dynamic>> menu = [
  {"title": "Administrar Canciones", "widget": SongsScreen()},
  {"title": "Counter", "widget": CounterScreen()}
];
