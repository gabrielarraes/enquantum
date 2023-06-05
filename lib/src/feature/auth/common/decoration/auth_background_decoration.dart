import 'package:flutter/material.dart';

BoxDecoration authBackgroundDecoration() {
  return BoxDecoration(          
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 10,
        offset: const Offset(0, 3),
      ),
    ],
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF020024),
        Color(0xFF090979),
        Color.fromARGB(255, 0, 32, 102),
      ],
      tileMode: TileMode.clamp,
    ),
  );
}