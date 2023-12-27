import 'package:epicwarrior/app/modules/game1/game1_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'arena_controller.dart';

class Arena {
  final String name;
  final String imageUrl;

  Arena({required this.name, required this.imageUrl});
}

class ArenaView extends GetView<ArenaController> {
  final ArenaController controller = Get.put(ArenaController());
  final List<Arena> arenas = [
    Arena(name: 'Borobudur', imageUrl: 'lib/app/assets/gameGatot/candi.jpeg'),
    // Add more characters as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArenaView'),
        centerTitle: true,
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
      itemCount: arenas.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            controller.selectArena(arenas[index].name);
            // Handle character selection here
            print('Selected: ${arenas[index].name}');
            Get.to(() => Game1View());
          },
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    arenas[index].imageUrl, // Use Image.asset for local assets
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => Text(
                      arenas[index].name,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color:
                            controller.selectedArena.value == arenas[index].name
                                ? Colors.blue //
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
