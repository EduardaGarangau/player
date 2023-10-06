class AudioProgressState {
  final Duration current;
  final Duration buffered;
  final Duration total;

  AudioProgressState({
    required this.current,
    required this.buffered,
    required this.total,
  });
}
