import 'package:mobx/mobx.dart';
import 'package:player/modules/player/params/open_player_params.dart';

import '../shared/models/album_model.dart';

part 'app_controller.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {
  @observable
  OpenPlayerParams? openPlayerParams;

  @action
  setOpenPlayerParams(OpenPlayerParams? params) {
    openPlayerParams = params;
  }

  @observable
  bool dismissPlayer = true;

  @action
  setDismissPlayer(bool value) {
    dismissPlayer = value;
  }

  @observable
  bool isPlaying = false;

  @action
  setIsPlaying(bool value) {
    isPlaying = value;
  }

  @observable
  AlbumModel? actualAlbumPlaying;

  @action
  setActualAlbumPlaying(AlbumModel? album) {
    actualAlbumPlaying = album;
  }

  void openPlayer(OpenPlayerParams openPlayerParams) {
    setOpenPlayerParams(openPlayerParams);
    setActualAlbumPlaying(openPlayerParams.album);
    setIsPlaying(true);
    setDismissPlayer(false);
  }

  void closePlayer() {
    setOpenPlayerParams(null);
    setDismissPlayer(true);
    setActualAlbumPlaying(null);
    setIsPlaying(false);
  }
}
