import 'package:flutter_modular/flutter_modular.dart';
import 'package:player/modules/album/screens/album_screen.dart';

class AlbumModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AlbumScreen()),
      ];
}
