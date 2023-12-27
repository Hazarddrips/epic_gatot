import 'package:epicwarrior/app/modules/pickwarrior/pickwarrior_controller.dart';
import 'package:get/get.dart';


class PickwarriorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickwarriorController>(
      () => PickwarriorController(),
    );
  }
}
