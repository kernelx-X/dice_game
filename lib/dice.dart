import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final int value;

  const Dice({
    super.key,
    required this.value,
  }) : assert(value >= 1 && value <= 6);

  static const Map<int, IconData> diceIcons = {
    1: Icons.looks_one,
    2: Icons.looks_two,
    3: Icons.looks_3,
    4: Icons.looks_4,
    5: Icons.looks_5,
    6: Icons.looks_6,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.deepPurple.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Icon(
        diceIcons[value]!,
        size: 100,
        color: Colors.deepPurpleAccent,
      ),
    );
  }
}