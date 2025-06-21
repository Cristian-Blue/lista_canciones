class SongsModels {
  final String title;
  final String description;
  final String genre;
  final String id;
  final String track_cid;
  final int duration;

  SongsModels(
      {required this.description,
      required this.genre,
      required this.id,
      required this.track_cid,
      required this.duration,
      required this.title});

  factory SongsModels.fromJson(Map<String, dynamic> json) => SongsModels(
        description: json['description'] ?? "No description",
        genre: json['genre'] ?? "No genre",
        id: json['id'] ?? "No id",
        track_cid: json['track_cid'] ?? "No track_cid",
        duration: json['duration'] ?? 0,
        title: json['title'] ?? "No title",
      );
<<<<<<< HEAD

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'genre': genre,
        'id': id,
        'track_cid': track_cid,
        'duration': duration,
      };
=======
>>>>>>> 8e659cdf7326b11699fe4f238ff95a0b2917d372
}
