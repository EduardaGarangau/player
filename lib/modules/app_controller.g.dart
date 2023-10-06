// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppController on _AppController, Store {
  late final _$openPlayerParamsAtom =
      Atom(name: '_AppController.openPlayerParams', context: context);

  @override
  OpenPlayerParams? get openPlayerParams {
    _$openPlayerParamsAtom.reportRead();
    return super.openPlayerParams;
  }

  @override
  set openPlayerParams(OpenPlayerParams? value) {
    _$openPlayerParamsAtom.reportWrite(value, super.openPlayerParams, () {
      super.openPlayerParams = value;
    });
  }

  late final _$dismissPlayerAtom =
      Atom(name: '_AppController.dismissPlayer', context: context);

  @override
  bool get dismissPlayer {
    _$dismissPlayerAtom.reportRead();
    return super.dismissPlayer;
  }

  @override
  set dismissPlayer(bool value) {
    _$dismissPlayerAtom.reportWrite(value, super.dismissPlayer, () {
      super.dismissPlayer = value;
    });
  }

  late final _$isPlayingAtom =
      Atom(name: '_AppController.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$actualAlbumPlayingAtom =
      Atom(name: '_AppController.actualAlbumPlaying', context: context);

  @override
  AlbumModel? get actualAlbumPlaying {
    _$actualAlbumPlayingAtom.reportRead();
    return super.actualAlbumPlaying;
  }

  @override
  set actualAlbumPlaying(AlbumModel? value) {
    _$actualAlbumPlayingAtom.reportWrite(value, super.actualAlbumPlaying, () {
      super.actualAlbumPlaying = value;
    });
  }

  late final _$_AppControllerActionController =
      ActionController(name: '_AppController', context: context);

  @override
  dynamic setOpenPlayerParams(OpenPlayerParams? params) {
    final _$actionInfo = _$_AppControllerActionController.startAction(
        name: '_AppController.setOpenPlayerParams');
    try {
      return super.setOpenPlayerParams(params);
    } finally {
      _$_AppControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDismissPlayer(bool value) {
    final _$actionInfo = _$_AppControllerActionController.startAction(
        name: '_AppController.setDismissPlayer');
    try {
      return super.setDismissPlayer(value);
    } finally {
      _$_AppControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsPlaying(bool value) {
    final _$actionInfo = _$_AppControllerActionController.startAction(
        name: '_AppController.setIsPlaying');
    try {
      return super.setIsPlaying(value);
    } finally {
      _$_AppControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setActualAlbumPlaying(AlbumModel? album) {
    final _$actionInfo = _$_AppControllerActionController.startAction(
        name: '_AppController.setActualAlbumPlaying');
    try {
      return super.setActualAlbumPlaying(album);
    } finally {
      _$_AppControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
openPlayerParams: ${openPlayerParams},
dismissPlayer: ${dismissPlayer},
isPlaying: ${isPlaying},
actualAlbumPlaying: ${actualAlbumPlaying}
    ''';
  }
}
