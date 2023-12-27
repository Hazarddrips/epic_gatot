import 'package:epicwarrior/app/modules/arena/arena_view.dart';
import 'package:epicwarrior/app/modules/pickwarrior/pickwarrior_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Character {
  final String name;
  final String imageUrl;

  Character({required this.name, required this.imageUrl});
}

class PickwarriorView extends GetView<PickwarriorController> {
  @override
  final PickwarriorController controller = Get.put(PickwarriorController());
  final List<Character> characters = [
    Character(
        name: 'Character 1', imageUrl: 'lib/app/assets/gameGatot/Gatot.png'),
    Character(
        name: 'Character 2', imageUrl: 'lib/app/assets/gameGatot/Pixel.png'),
    Character(
        name: 'Character 3', imageUrl: 'lib/app/assets/gameGatot/Pixel.png'),
    // Add more characters as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a Character'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > constraints.maxHeight) {
            // Landscape mode
            return buildLandscapeLayout();
          } else {
            // Portrait mode
            return buildPortraitLayout();
          }
        },
      ),
    );
  }

  Widget buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(
          child: buildGridView(),
        ),
        // You can add more widgets for landscape mode if needed
      ],
    );
  }

  Widget buildPortraitLayout() {
    return buildGridView();
  }

  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            controller.selectCharacter(characters[index].name);
            // Handle character selection here
            print('Selected: ${characters[index].name}');
            Get.to(() => ArenaView());
          },
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    characters[index]
                        .imageUrl, // Use Image.asset for local assets
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => Text(
                      characters[index].name,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: controller.selectedCharacter.value ==
                                characters[index].name
                            ? Colors.blue // Change color for selected character
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
