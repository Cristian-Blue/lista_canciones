import 'package:flutter/material.dart';
import 'package:lista_canciones/config/router.dart';

class DrawerCustom extends StatelessWidget {
  final int i;
  final void Function(int) changeItem;

  const DrawerCustom({super.key, required this.i, required this.changeItem});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        padding: const EdgeInsets.all(2.0),
        itemCount: menu.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(menu[index]["title"]),
            selected: i == index,
            onTap: () {
              changeItem(index);
            },
          );
        },
      ),
    );
  }
}
