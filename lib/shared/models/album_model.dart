import 'package:player/shared/models/music_model.dart';

class AlbumModel {
  final String name;
  final String artist;
  final String imagePath;
  final List<MusicModel> musics;

  AlbumModel({
    required this.name,
    required this.artist,
    required this.imagePath,
    required this.musics,
  });

  int get tracksLength => musics.length;
}
