import 'package:flutter/material.dart';
import 'package:lista_canciones/config/app_theme.dart';
import 'package:lista_canciones/presentation/screens/homeScreens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 2).themeData(),
      home: const Home(),
    );
  }
}
