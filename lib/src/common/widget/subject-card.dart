import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key, required this.text, required this.imgPath,
  });

  final String text;
  final String imgPath;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      border: Border.all(color: const Color(0xFFCAC4D0)),
      color: const Color(0xFFFEF7FF),
    ),
    height: 80.0,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(text, style: const TextStyle(color: Colors.black, fontSize: 16.0))
          ),
          Image(image: AssetImage(imgPath))
        ],
      ),
    )
  );
}