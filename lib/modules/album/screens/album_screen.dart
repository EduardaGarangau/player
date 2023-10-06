import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:player/modules/album/components/album_details.dart';
import 'package:player/modules/album/components/music_widget.dart';
import 'package:player/modules/app_controller.dart';
import 'package:player/modules/player/params/open_player_params.dart';
import 'package:player/modules/player_scaffold.dart';
import 'package:player/shared/models/album_model.dart';

import '../../player/controllers/player_controller.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  final appController = Modular.get<AppController>();
  final miniPlayerController = Modular.get<MiniplayerController>();
  final playerController = Modular.get<PlayerController>();
  final album = Modular.args.data as AlbumModel;

  @override
  Widget build(BuildContext context) {
    return PlayerScaffold(
      backgroundColor: Colors.grey.shade200,
      customBody: Stack(
        children: [
          Column(
            children: [
              AlbumDetails(album: album),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: album.musics.length,
                  itemBuilder: (context, index) {
                    final music = album.musics[index];

                    return InkWell(
                      onTap: () {
                        _playSong(index);
                      },
                      child: MusicWidget(
                        music: music,
                        albumImage: album.imagePath,
                        artist: album.artist,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          _playButton(),
        ],
      ),
    );
  }

  Widget _playButton() {
    return Positioned(
      left: 143,
      top: 365,
      child: InkWell(
        onTap: _playAlbum,
        child: Container(
          width: 130,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 28,
              ),
              SizedBox(width: 5),
              Text(
                'PLAY',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _playAlbum() {
    if (appController.actualAlbumPlaying == null ||
        appController.actualAlbumPlaying != album) {
      final openPlayerParams = OpenPlayerParams(
        album: album,
        musics: album.musics,
      );
      if (appController.isPlaying) {
        playerController.stop();
      }
      playerController.init(album, album.musics);
      appController.openPlayer(openPlayerParams);
      miniPlayerController.animateToHeight(state: PanelState.MIN);
    } else {
      miniPlayerController.animateToHeight(state: PanelState.MAX);
    }
  }

  void _playSong(int songIndex) {
    final openPlayerParams = OpenPlayerParams(
      album: album,
      musics: album.musics,
    );
    if (appController.isPlaying) {
      playerController.stop();
    }
    playerController.init(album, album.musics, initialIndex: songIndex);
    appController.openPlayer(openPlayerParams);
    miniPlayerController.animateToHeight(state: PanelState.MIN);
  }
}
