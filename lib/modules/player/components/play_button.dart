import 'package:flutter/material.dart';
import 'package:player/modules/player/controllers/player_controller.dart';
import 'package:player/modules/player/states/player_button_state.dart';

class PlayButton extends StatelessWidget {
  final PlayerController controller;
  final double size;

  const PlayButton({
    super.key,
    required this.controller,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<PlayerButtonState>(
      valueListenable: controller.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case PlayerButtonState.loading:
            return SizedBox(
              height: size,
              width: size,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          case PlayerButtonState.paused:
            return IconButton(
              onPressed: controller.play,
              icon: Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: size,
              ),
            );
          case PlayerButtonState.playing:
            return IconButton(
              onPressed: controller.pause,
              icon: Icon(
                Icons.pause_rounded,
                color: Colors.white,
                size: size,
              ),
            );
        }
      },
    );
  }
}
