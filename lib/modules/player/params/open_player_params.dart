import 'package:player/shared/models/album_model.dart';
import 'package:player/shared/models/music_model.dart';

class OpenPlayerParams {
  final AlbumModel album;
  final List<MusicModel> musics;

  OpenPlayerParams({
    required this.album,
    required this.musics,
  });
}
