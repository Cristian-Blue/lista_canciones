import 'package:flutter/material.dart';
import 'package:lista_canciones/presentation/screens/screens.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({super.key});

  @override
  State<SongsScreen> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _menuOptions = <Widget>[
    AddSongs(),
    ListSongs(),
  ];

  void _changeSelection(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _menuOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _changeSelection,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Agregar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Consulatr",
          ),
        ],
      ),
    );
  }
}
