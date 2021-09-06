import 'package:flutter/material.dart';

class CircularAvatar extends StatelessWidget {
  const CircularAvatar({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      width: 140.0,
      height: 140.0,
      decoration: BoxDecoration(
          color: Colors.red,
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(75.0)),
          boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)]),
    );
  }
}
