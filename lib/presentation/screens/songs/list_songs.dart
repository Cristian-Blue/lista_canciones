import 'package:flutter/material.dart';
import 'package:lista_canciones/core/helpers/songs.dart';

class ListSongs extends StatelessWidget {
  const ListSongs({super.key});

  @override
  Widget build(BuildContext context) {
    final petition = Songs();
    return FutureBuilder(
        future: petition.getTrending(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error"));
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(data[index].title),
                  subtitle: Text(data[index].description),
                );
              },
            );
          } else {
            return const Center(child: Text("No data"));
          }
        });
  }
}
