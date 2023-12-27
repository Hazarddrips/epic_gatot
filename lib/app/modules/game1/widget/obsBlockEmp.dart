import 'package:flutter/material.dart';

class ObsBlockEmp extends StatelessWidget {
  final double x;
  final double y;
  final Future<void> Function()? onTap; // Change the type

  ObsBlockEmp({required this.x, required this.y, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: GestureDetector(
        onTap: onTap != null ? () async => await onTap!() : null,
        // Use async/await if onTap is non-null
        child: Container(
          height: 35,
          width: 35,
          child: Transform.scale(
            scale: 2.5,
            child: Image.asset('lib/app/assets/gameMario/Block.png'),
          ),
        ),
      ),
    );
  }
}
