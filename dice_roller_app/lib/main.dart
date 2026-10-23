import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                 Color.fromARGB(255, 153, 203, 244),
                 Color.fromARGB(255, 242, 167, 192),]
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize :MainAxisSize.min,
              children: [
                const Text("Image"),
                TextButton(onPressed: () {}, child: const Text("Press Me")),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}