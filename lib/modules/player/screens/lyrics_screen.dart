import 'package:flutter/material.dart';

import '../controllers/player_controller.dart';

class LyricsScreen extends StatefulWidget {
  final PlayerController controller;

  const LyricsScreen({
    super.key,
    required this.controller,
  });

  @override
  State<LyricsScreen> createState() => _LyricsScreenState();
}

class _LyricsScreenState extends State<LyricsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height - 60;

    return Scaffold(
      backgroundColor: Colors.indigo.shade400,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade400,
        toolbarHeight: 60,
        elevation: 0,
        centerTitle: true,
        title: ValueListenableBuilder(
          valueListenable: widget.controller.currentAudioTitleNotifier,
          builder: (_, value, __) => Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 70,
              ),
              child: Center(
                child: ValueListenableBuilder<String>(
                  valueListenable: widget.controller.currentAudioLyricsNotifier,
                  builder: (_, value, __) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Text(
                        value,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 4,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          IgnorePointer(
            child: Container(
              height: size,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.indigo.shade400,
                    Colors.indigo.shade400.withOpacity(0.1),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.indigo.shade400.withOpacity(0.1),
                    Colors.indigo.shade400,
                    Colors.indigo.shade400,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
