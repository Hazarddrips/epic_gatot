import 'package:get/get.dart';

class ArenaController extends GetxController {
  //TODO: Implement ArenaController
  var selectedArena = RxString('');

  void selectArena(String name) {
    selectedArena.value = name;
  }
}
