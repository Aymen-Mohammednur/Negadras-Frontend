import 'package:flutter/material.dart';


class Bubble extends StatelessWidget {
  final double height;
  final double width;
  const Bubble({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(100.0),
      decoration: BoxDecoration(
          color: Color(0xFFBF00).withOpacity(0.50), shape: BoxShape.circle),
    );
  }
}
