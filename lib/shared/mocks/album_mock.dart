import 'package:player/shared/models/album_model.dart';
import 'package:player/shared/models/music_model.dart';

class AlbumMock {
  static final List<AlbumModel> albums = [
    AlbumModel(
      name: 'My Way',
      artist: 'Frank Sinatra',
      imagePath: 'assets/images/my_way.jpeg',
      musics: [
        MusicModel(
          name: 'Fly Me To The Moon',
          lyrics:
              'Fly me to the moon\nLet me play among the stars\nLet me see what spring is like\nOn Jupiter and Mars\nIn other words, hold my hand\nIn other words, darling, kiss me\nFill my life with song\nAnd let me sing for ever more\nYou are all I long for\nAll I worship and adore\nIn other words, please be true\nIn other words, I love you\nFly me to the moon\nLet me play among the stars\nLet me see what spring is like\nOn Jupiter and Mars\nIn other words, hold my hand\nIn other words, darling, kiss me\nFill my life with song\nLet me sing for ever more\nAll I worship and adore\nYou are all I long for\nIn other words, please be true\nIn other words, in other words\nIn other words, in other words\nIn other words\nI love you',
          path: 'assets/musics/Fly Me To The Moon (2008 Remastered).mp3',
        ),
        MusicModel(
          name: 'My Way',
          lyrics: '',
          path: 'assets/musics/My Way (2008 Remastered).mp3',
        ),
      ],
    ),
    AlbumModel(
      name: 'Whitney',
      artist: 'Whitney Houston',
      imagePath: 'assets/images/whitney_houston.jpeg',
      musics: [
        MusicModel(
          name: 'I Wanna Dance With Somebody',
          lyrics: '',
          path: 'assets/musics/I Wanna Dance With Somebody.mp3',
        ),
        MusicModel(
          name: 'Greatest Love Of All',
          lyrics: '',
          path: 'assets/musics/Greatest Love Of All.mp3',
        ),
      ],
    ),
  ];
}
