import 'package:flutter/material.dart';

class AddResource extends StatelessWidget {
  final Function function;

  const AddResource({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () => function(),
        child: Image.asset(
          'lib/app/assets/gameGatot/+.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
