import 'package:flutter/material.dart';
import 'package:dice_roller_app/die.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                 Color.fromARGB(255, 153, 203, 244),
                 Color.fromARGB(255, 242, 167, 192),]
            ),
          ),
          child: const Center(
            child: Column(
              mainAxisSize :MainAxisSize.min,
              children: [
                Die(),
                SizedBox(height: 20),
                Text(
                  "Press the dice to roll it",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}