import 'package:flutter_modular/flutter_modular.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:player/modules/app_controller.dart';
import 'package:player/modules/player/controllers/player_controller.dart';

import 'album/album_module.dart';
import 'home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => MiniplayerController()),
        Bind((i) => AppController()),
        Bind((i) => PlayerController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/album', module: AlbumModule()),
      ];
}
