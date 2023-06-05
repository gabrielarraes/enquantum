import 'package:flutter/material.dart';

InputDecoration authInputDecoration(String label, bool hasError) {
  
  OutlineInputBorder borderDecoration = OutlineInputBorder(
    borderSide: BorderSide(color: !hasError ? Colors.white60 : Colors.red, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(24))
  );

  OutlineInputBorder borderDecorationFocused = OutlineInputBorder(
    borderSide: BorderSide(color: !hasError ? Colors.white : Colors.red, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(24))
  );

  return InputDecoration(
    label: Text(
      label,
      style: TextStyle(
        letterSpacing: 2.0,
        fontSize: 12.0,
        color: !hasError ? Colors.white : Colors.red
      )
    ),
    border: borderDecoration,
    focusedBorder: borderDecorationFocused,
    enabledBorder: borderDecoration,
    floatingLabelBehavior: FloatingLabelBehavior.always,
  );
}