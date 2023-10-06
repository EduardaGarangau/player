import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:player/modules/app_controller.dart';
import 'package:player/modules/player/controllers/player_controller.dart';
import 'package:player/modules/player/screens/lyrics_screen.dart';
import 'package:player/modules/player/states/audio_progress_state.dart';
import 'package:player/shared/models/album_model.dart';
import 'package:player/shared/models/music_model.dart';

import '../components/lyrics_button.dart';
import '../components/next_button.dart';
import '../components/play_button.dart';
import '../components/previous_button.dart';

class MusicPlayer extends StatefulWidget {
  final MiniplayerController miniplayerController;
  final AlbumModel album;
  final List<MusicModel> musics;

  const MusicPlayer({
    super.key,
    required this.album,
    required this.miniplayerController,
    required this.musics,
  });

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final controller = Modular.get<PlayerController>();
  final appController = Modular.get<AppController>();

  @override
  void initState() {
    super.initState();
    if (!appController.isPlaying) {
      appController.setIsPlaying(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight;

        // Miniplayer
        if (maxHeight <= 100) {
          return Container(
            height: 100,
            padding: const EdgeInsets.only(
              left: 10,
            ),
            color: Colors.indigo.shade400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          widget.album.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ValueListenableBuilder<String>(
                          valueListenable: controller.currentAudioTitleNotifier,
                          builder: (_, value, __) => ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 180,
                            ),
                            child: Text(
                              value,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.album.artist,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PreviousButton(controller: controller, size: 30),
                    PlayButton(controller: controller, size: 30),
                    NextButton(controller: controller, size: 30),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Material(
            child: Container(
              color: Colors.indigo.shade400,
              child: SafeArea(
                child: ListView(
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              widget.miniplayerController.animateToHeight(
                                state: PanelState.MIN,
                              );
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 350,
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          widget.album.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: ValueListenableBuilder<AudioProgressState>(
                              valueListenable: controller.progressNotifier,
                              builder: (_, value, __) => ProgressBar(
                                baseBarColor: Colors.grey.shade300,
                                timeLabelPadding: 5,
                                progress: value.current,
                                buffered: value.buffered,
                                total: value.total,
                                onSeek: controller.seek,
                                barHeight: 3.0,
                                thumbRadius: 5,
                                bufferedBarColor: Colors.blue.shade200,
                                thumbColor: Colors.white,
                                timeLabelLocation: TimeLabelLocation.below,
                                timeLabelTextStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                      height: 80,
                      child: Column(
                        children: [
                          ValueListenableBuilder<String>(
                            valueListenable:
                                controller.currentAudioTitleNotifier,
                            builder: (_, value, __) => Text(
                              value,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${widget.album.artist}  -  ${widget.album.name}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PreviousButton(controller: controller, size: 60),
                        const SizedBox(width: 25),
                        PlayButton(controller: controller, size: 60),
                        const SizedBox(width: 25),
                        NextButton(controller: controller, size: 60),
                        const SizedBox(width: 30),
                      ],
                    ),
                    const SizedBox(height: 40),
                    InkWell(
                      onTap: () => Modular.to.push(
                        MaterialPageRoute(
                          builder: (context) => LyricsScreen(
                            controller: controller,
                          ),
                        ),
                      ),
                      child: const LyricsButton(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
