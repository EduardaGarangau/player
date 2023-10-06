import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:player/modules/player/states/audio_progress_state.dart';
import 'package:player/modules/player/states/player_button_state.dart';
import 'package:player/shared/models/album_model.dart';

import '../../../shared/models/music_model.dart';

class PlayerController {
  late AudioPlayer _audioPlayer;

  late ConcatenatingAudioSource _playlist;

  // Lista do nome dos áudios da playlist
  final playlistNotifier = ValueNotifier<List<String>>([]);

  // Título do Áudio atual que está sendo reproduzido
  final currentAudioTitleNotifier = ValueNotifier<String>('');

  // Letra do áudio atual que está sendo reproduzido
  final currentAudioLyricsNotifier = ValueNotifier<String>('');

  // Progresso do áudio que está sendo reproduzido
  final progressNotifier = ValueNotifier<AudioProgressState>(
    AudioProgressState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );

  // Se é o primeiro áudio da playlist que está sendo reproduzido
  final isFirstAudioNotifier = ValueNotifier<bool>(true);

  // Se é o último áudio da playlist que está sendo reproduzido
  final isLastAudioNotifier = ValueNotifier<bool>(true);

  // Estado do botão do player
  final playButtonNotifier = ValueNotifier<PlayerButtonState>(
    PlayerButtonState.loading,
  );

  void init(
    AlbumModel album,
    List<MusicModel> musics, {
    int initialIndex = 0,
  }) {
    _audioPlayer = AudioPlayer();
    _setPlaylist(musics, initialIndex, album);
    _listenForChangesInPlayerState();
    _listenForChangesInPlayerPosition();
    _listenForChangesInBufferedPosition();
    _listenForChangesInTotalDuration();
    _listenForChangesInSequenceState();
    play();
  }

  // Criando a playlist
  void _setPlaylist(
    List<MusicModel> musics,
    int initialIndex,
    AlbumModel album,
  ) async {
    _playlist = ConcatenatingAudioSource(
      children: musics
          .map(
            (music) => AudioSource.asset(
              music.path,
              tag: MediaItem(
                id: music.hashCode.toString(),
                album: album.name,
                title: music.name,
                artist: album.artist,
                displayDescription: music.lyrics,
              ),
            ),
          )
          .toList(),
    );
    await _audioPlayer.setAudioSource(_playlist, initialIndex: initialIndex);
  }

  void _listenForChangesInPlayerState() {
    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;

      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        playButtonNotifier.value = PlayerButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = PlayerButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        playButtonNotifier.value = PlayerButtonState.playing;
      } else {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });
  }

  void _listenForChangesInPlayerPosition() {
    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;

      progressNotifier.value = AudioProgressState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInBufferedPosition() {
    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;

      progressNotifier.value = AudioProgressState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInTotalDuration() {
    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;

      progressNotifier.value = AudioProgressState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void _listenForChangesInSequenceState() {
    _audioPlayer.sequenceStateStream.listen((sequenceState) {
      if (sequenceState == null) return;

      final currentItem = sequenceState.currentSource;
      // Atualizar o título do áudio atual
      currentAudioTitleNotifier.value = (currentItem?.tag as MediaItem).title;

      // Atualizar Playlist
      final playlist = sequenceState.effectiveSequence;
      final titles =
          playlist.map((item) => (item.tag as MediaItem).title).toList();
      playlistNotifier.value = titles;

      // Atualizar letra do áudio
      currentAudioLyricsNotifier.value =
          (currentItem?.tag as MediaItem).displayDescription!;

      // Atualizar botões próximo e anterior
      if (playlist.isEmpty || currentItem == null) {
        isFirstAudioNotifier.value = true;
        isLastAudioNotifier.value = true;
      } else {
        isFirstAudioNotifier.value = playlist.first == currentItem;
        isLastAudioNotifier.value = playlist.last == currentItem;
      }
    });
  }

  void stop() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void skipTo(int position) {
    _audioPlayer.seek(const Duration(seconds: 0), index: position);
  }

  void onPreviousAudioButtonPressed() {
    _audioPlayer.seekToPrevious();
  }

  void onNextAudioButtonPressed() {
    _audioPlayer.seekToNext();
  }
}
