import 'package:epicwarrior/app/modules/arena/arena_view.dart';
import 'package:epicwarrior/app/modules/home/home_controller.dart';
import 'package:epicwarrior/app/modules/home/widgets/add_resource.dart';
import 'package:epicwarrior/app/modules/home/widgets/arena_button.dart';
import 'package:epicwarrior/app/modules/home/widgets/dollar.dart';
import 'package:epicwarrior/app/modules/home/widgets/fight_button.dart';
import 'package:epicwarrior/app/modules/home/widgets/fightpass_button.dart';
import 'package:epicwarrior/app/modules/home/widgets/gems.dart';
import 'package:epicwarrior/app/modules/home/widgets/quest_button.dart';
import 'package:epicwarrior/app/modules/home/widgets/setting_button.dart';
import 'package:epicwarrior/app/modules/pickwarrior/pickwarrior_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SettingButton(
                  function: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Dollar(
                      text: '99',
                      function: () {
                        // Your button function logic here
                      },
                    ),
                    Gems(
                      text: '99',
                      function: () {
                        // Your button function logic here
                      },
                    ),
                    AddResource(
                      function: () {
                        // Your button function logic here
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Stack(
                children: [
                  // Background Image
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('lib/app/assets/gameGatot/baground.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Additional Image (Adjust position as needed)
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'lib/app/assets/gameGatot/Gatot.png',
                    ),
                  ),
                  // Your existing ListView
                  ListView(
                    children: [
                      FightPassButton(
                        function: () {
                          // Your button function logic here
                        },
                      ),
                      ArenaButton(
                        function: () {
                          Get.to(() => ArenaView());
                          // Your button function logic here
                        },
                      ),
                      QuestButton(
                        function: () {
                          // Your button function logic here
                        },
                      ),
                      FightButton(
                        function: () {
                          Get.to(() => PickwarriorView());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 5,
            color: Colors.green,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/app/assets/gameGatot/TANAH.png'),
                  fit: BoxFit.fitWidth,
                  alignment: FractionalOffset(1.0, 0.1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
