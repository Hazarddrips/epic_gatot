import 'package:flutter/material.dart';

class PlayerName extends StatelessWidget {
  final Function function;

  const PlayerName({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => function(),
            child: Row(
              children: [
                Image.asset(
                  'lib/app/assets/gameGatot/fight pass.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
