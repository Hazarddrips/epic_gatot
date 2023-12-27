import 'package:epicwarrior/app/modules/game1/game1_binding.dart';
import 'package:epicwarrior/app/modules/game1/game1_view.dart';
import 'package:epicwarrior/app/modules/home/home_binding.dart';
import 'package:epicwarrior/app/modules/home/home_view.dart';
import 'package:epicwarrior/app/modules/pickwarrior/pickwarrior_binding.dart';
import 'package:epicwarrior/app/modules/pickwarrior/pickwarrior_view.dart';
import 'package:get/get.dart';

import '../modules/arena/arena_binding.dart';
import '../modules/arena/arena_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PICKWARRIOR,
      page: () => PickwarriorView(),
      binding: PickwarriorBinding(),
    ),
    GetPage(
      name: _Paths.ARENA,
      page: () => ArenaView(),
      binding: ArenaBinding(),
    ),
    GetPage(
      name: _Paths.GAME1,
      page: () => Game1View(),
      binding: Game1Binding(),
    ),
  ];
}
