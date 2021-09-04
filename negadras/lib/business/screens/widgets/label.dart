import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String label;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final double fontSize;
  final Color fontColor;
  const Label({
    Key? key,
    required this.label,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.normal,
    this.fontColor = Colors.black,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontStyle: fontStyle,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: fontColor),
    );
  }
}
