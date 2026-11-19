import 'dart:math';
import 'package:flutter/material.dart';

class Die extends StatefulWidget {
  const Die({super.key});

  @override
  State<Die> createState() => _DieState();
}

class _DieState extends State<Die> {
  int dieNumber = 1;
  bool isRolling = false;
  final _random = Random();

  static const Map<int, Set<int>> _dotPatterns = {
    1: {4},
    2: {0, 8},
    3: {0, 4, 8},
    4: {0, 2, 6, 8},
    5: {0, 2, 4, 6, 8},
    6: {0, 2, 3, 5, 6, 8},
  };

  void rollDie() {
    setState(() {
      dieNumber = _random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeDots = _dotPatterns[dieNumber] ?? {};
    return GestureDetector(
      //container clickable
      onTap: () async {
        if (isRolling) return; // Prevent rolling again
        setState(() {
          isRolling = true;
        });
        //animation
        for (int i = 0; i < 8; i++) {
          await Future.delayed(Duration(milliseconds: 100 * i));
          setState(() {
            rollDie();
          });
        }
        setState(() {
          isRolling = false;
        });
      },
      child: Container(
        width: 120,
        height: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: GridView.count(
          crossAxisCount: 3, // creates a 3x3 grid to display the dots
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(9, (index) {
            return Center(
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: activeDots.contains(index)
                      ? Colors.black
                      : Colors.transparent,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}