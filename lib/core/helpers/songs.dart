import 'package:dio/dio.dart';
import 'package:lista_canciones/core/constants/api_audius_constants.dart';
import 'package:lista_canciones/models/songs_models.dart';

class Songs {
  final _dio = Dio();

  Future<List<SongsModels>> getTrending() async {
    try {
      final response = await _dio.get(ApiAudiusConstants.getTrending);

      if (response.statusCode == 200) {
        List<SongsModels> songs = (response.data['data'] as List)
            .map((e) => SongsModels.fromJson(e))
            .toList();
<<<<<<< HEAD
=======
        print("Enter to getTrending");
        print(songs);
>>>>>>> 8e659cdf7326b11699fe4f238ff95a0b2917d372
        return songs;
      } else {
        return [];
      }
    } catch (e) {
<<<<<<< HEAD
=======
      print("Error: $e");
>>>>>>> 8e659cdf7326b11699fe4f238ff95a0b2917d372
      return [];
    }
  }
}
