import 'package:flutter/material.dart';

import '../controllers/player_controller.dart';

class PreviousButton extends StatelessWidget {
  final PlayerController controller;
  final double size;

  const PreviousButton({
    super.key,
    required this.controller,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.isFirstAudioNotifier,
      builder: (_, value, __) {
        return IconButton(
          onPressed: value ? null : controller.onPreviousAudioButtonPressed,
          icon: Icon(
            Icons.skip_previous_rounded,
            color: Colors.white,
            size: size,
          ),
        );
      },
    );
  }
}
