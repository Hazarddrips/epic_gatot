import 'dart:math';
import 'package:flutter/material.dart';

class MyMario extends StatelessWidget {
  final direction;
  bool midrun;
  bool midjump;
  String checkMarioType;
  double height;

  MyMario(
      {this.direction,
      required this.midrun,
      required this.midjump,
      required this.checkMarioType,
      required this.height});

  // Add these lines to define the size of the Mario character
  static const double marioWidth = 30; // Adjust as needed
  static const double marioHeight = 30; // Adjust as needed

  @override
  Widget build(BuildContext context) {
    String asset = midjump
        ? 'lib/app/assets/gameGatot/Gatot.png'
        : midrun
            ? 'lib/app/assets/gameGatot/Gatot.png'
            : 'lib/app/assets/gameGatot/Gatot.png';

    // Use marioWidth and marioHeight in the collision detection logic
    return SizedBox(
      width: marioWidth,
      height: marioHeight,
      child: direction == 'right'
          ? Transform.scale(
              scale: 2.8,
              child: Image.asset(asset),
            )
          : Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: Transform.scale(
                scale: 2.8,
                child: Image.asset(asset),
              ),
            ),
    );
  }
}
