class SongsEntity {
  final String title;
  final String description;
  final String genre;
  final String id;
  final String track_cid;
  final String duration;

  SongsEntity(
      {required this.description,
      required this.genre,
      required this.id,
      required this.track_cid,
      required this.duration,
      required this.title});

  factory SongsEntity.fromJson(Map<String, dynamic> json) {
    return SongsEntity(
      description: json['description'] as String,
      genre: json['genre'] as String,
      id: json['id'] as String,
      track_cid: json['track_cid'] as String,
      duration: json['duration'] as String,
      title: json['title'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'genre': genre,
      'id': id,
      'track_cid': track_cid,
      'duration': duration,
      'title': title,
    };
  }
}
