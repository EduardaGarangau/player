import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:player/modules/app_controller.dart';
import 'package:player/modules/player/screens/music_player.dart';

class PlayerScaffold extends Scaffold {
  final Widget customBody;

  PlayerScaffold({
    super.backgroundColor,
    super.key,
    super.appBar,
    super.bottomNavigationBar,
    required this.customBody,
  }) : super(
          body: MiniPlayer(customBody: customBody),
        );
}

class MiniPlayer extends StatelessWidget {
  final Widget customBody;

  const MiniPlayer({
    required this.customBody,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final miniPlayerController = Modular.get<MiniplayerController>();
    final appController = Modular.get<AppController>();

    return Stack(
      children: [
        customBody,
        Observer(
          builder: (context) {
            return Offstage(
              offstage: appController.dismissPlayer,
              child: Miniplayer(
                controller: miniPlayerController,
                minHeight: 80.0,
                maxHeight: MediaQuery.of(context).size.height,
                builder: (height, percentage) {
                  if (appController.dismissPlayer == true) {
                    return Container();
                  }

                  return MusicPlayer(
                    album: appController.openPlayerParams!.album,
                    musics: appController.openPlayerParams!.musics,
                    miniplayerController: miniPlayerController,
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
