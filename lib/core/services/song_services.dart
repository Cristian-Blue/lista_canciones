import 'package:lista_canciones/core/helpers/save_local.dart';
import 'package:lista_canciones/models/song_model.dart';

class SongService {
  Future<String> saveSong(SongModel song) async {
    bool helper = await SaveLocal.setItem('song', song.toJson());
    return helper ? 'Guardado correctamente' : 'No se pudo guardar';
  }

  Future<List<SongModel>> getSongs() async {
    try {
      List<dynamic> data = await SaveLocal.getItem("song");
      print("Datos obtenidos: $data");
      print("Tipo de datos: ${data.runtimeType}");
      print("-----------");

      List<SongModel> response = [];

      if (data != null && data is List) {
        response = data.map((item) => SongModel.fromJson(item)).toList();
      }

      return response;
    } catch (e) {
      print("Error al obtener canciones: $e");
      return [];
    }
  }
}
