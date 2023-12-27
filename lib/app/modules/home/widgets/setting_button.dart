import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final Function function;

  const SettingButton({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        child: GestureDetector(
          onTap: () => function(),
          child: Image.asset(
            'lib/app/assets/gameGatot/SETTING.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
