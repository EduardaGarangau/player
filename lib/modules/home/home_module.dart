import 'package:flutter_modular/flutter_modular.dart';
import 'package:player/modules/home/screens/home_screen.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomeScreen()),
      ];
}
