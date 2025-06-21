class SongModel {
  String name;
  String tone;
  String lyrics;
  String type;

  SongModel(
      {required this.name,
      required this.tone,
      required this.lyrics,
      required this.type});

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
      name: json['name'] ?? "No name",
      tone: json['tone'] ?? "No tone",
      lyrics: json['lyrics'] ?? "No lyrics",
      type: json['type'] ?? "No type");

  Map<String, dynamic> toJson() => {
        'name': name,
        'tone': tone,
        'lyrics': lyrics,
        'type': type,
      };
}
