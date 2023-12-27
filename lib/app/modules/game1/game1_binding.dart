import 'package:epicwarrior/app/modules/game1/game1_controller.dart';
import 'package:get/get.dart';



class Game1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Game1Controller>(
      () => Game1Controller(),
    );
  }
}
