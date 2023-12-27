import 'package:flutter/material.dart';

class Gems extends StatelessWidget {
  final String text;
  final Function function;

  const Gems({super.key, required this.text, required this.function});

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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 50,
                    height: 40,
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        text,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  'lib/app/assets/gameGatot/gems.png',
                  width: 30,
                  height: 30,
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
