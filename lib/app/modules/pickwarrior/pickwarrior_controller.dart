import 'package:get/get.dart';

class PickwarriorController extends GetxController {
  var selectedCharacter = RxString('');

  void selectCharacter(String name) {
    selectedCharacter.value = name;
  }
}
