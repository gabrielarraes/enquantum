import 'package:flutter/material.dart';

InputDecoration authInputDecoration(String label, bool hasError) {
  
  OutlineInputBorder borderDecoration = OutlineInputBorder(
    borderSide: BorderSide(color: !hasError ? Colors.black : Colors.red, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(4))
  );

  OutlineInputBorder borderDecorationFocused = OutlineInputBorder(
    borderSide: BorderSide(color: !hasError ? Colors.black : Colors.red, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(4))
  );

  return InputDecoration(
    label: Text(
      label,
      style: TextStyle(
        letterSpacing: 2.0,
        fontSize: 12.0,
        color: !hasError ? Colors.black : Colors.red
      )
    ),
    border: borderDecoration,
    focusedBorder: borderDecorationFocused,
    enabledBorder: borderDecoration,
    floatingLabelBehavior: FloatingLabelBehavior.always,
  );
}