import 'package:flutter/material.dart';
import 'package:lista_canciones/config/router.dart';
import 'package:lista_canciones/presentation/widgets/layout/appBar.dart';
import 'package:lista_canciones/presentation/widgets/layout/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _i = 0;

  @override
  Widget build(BuildContext context) {
    void changeItem(int index) {
      setState(() {
        _i = index;
      });
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBarCustom(title: menu[_i]["title"]),
      drawer: DrawerCustom(i: _i, changeItem: changeItem),
      body: menu[_i]["widget"],
    );
  }
}
