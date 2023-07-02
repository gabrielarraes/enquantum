import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

TeXViewDocument descriptionText(String text, int? spaceBottom) => TeXViewDocument(
  text, style: TeXViewStyle(
    contentColor: Colors.black87,
    margin: TeXViewMargin.only(bottom: spaceBottom ?? 0),
    fontStyle: TeXViewFontStyle(fontWeight: TeXViewFontWeight.w500, fontFamily: 'Poppins')
  )
);