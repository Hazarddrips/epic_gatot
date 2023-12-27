import 'package:get/get.dart';
import 'arena_controller.dart';

class ArenaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArenaController>(
      () => ArenaController(),
    );
  }
}
