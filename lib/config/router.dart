import 'package:lista_canciones/presentation/screens/screens.dart';

const List<Map<String, dynamic>> menu = [
  {"title": "Agregar canción", "widget": AddSongs()},
  {"title": "Lista de canciones", "widget": ListSongs()},
  {"title": "Detalles de canción", "widget": DetailSongs()}
];
