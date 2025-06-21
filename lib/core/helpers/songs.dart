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
        return songs;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
