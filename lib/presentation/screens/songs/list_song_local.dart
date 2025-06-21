import 'package:flutter/material.dart';
import 'package:lista_canciones/core/services/song_services.dart';

class ListSongLocal extends StatelessWidget {
  const ListSongLocal({super.key});

  @override
  Widget build(BuildContext context) {
    final petition = SongService();
    return FutureBuilder(
        future: petition.getSongs(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(child: Text("Error"));
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(data[index].name),
                  subtitle: Text(data[index].tone),
                );
              },
            );
          } else {
            return const Center(child: Text("No data"));
          }
        });
  }
}
