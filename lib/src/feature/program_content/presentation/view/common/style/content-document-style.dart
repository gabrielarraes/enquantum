import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

const DocumentStyle = TeXViewStyle(
  margin: TeXViewMargin.all(5),
  padding: TeXViewPadding.all(10),
  borderRadius: TeXViewBorderRadius.all(10),
  elevation: 3,
  contentColor: Color.fromRGBO(73, 4, 163, 1),

  border: TeXViewBorder.all(
    TeXViewBorderDecoration(
        borderColor: Colors.deepPurple,
        borderStyle: TeXViewBorderStyle.solid,
        borderWidth: 5),
  ),
  backgroundColor: Colors.white,
);