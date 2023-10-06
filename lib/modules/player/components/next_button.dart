import 'package:flutter/material.dart';
import 'package:player/modules/player/controllers/player_controller.dart';

class NextButton extends StatelessWidget {
  final PlayerController controller;
  final double size;

  const NextButton({
    super.key,
    required this.controller,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.isLastAudioNotifier,
      builder: (_, value, __) {
        return IconButton(
          onPressed: value ? null : controller.onNextAudioButtonPressed,
          icon: Icon(
            Icons.skip_next_rounded,
            color: Colors.white,
            size: size,
          ),
        );
      },
    );
  }
}
