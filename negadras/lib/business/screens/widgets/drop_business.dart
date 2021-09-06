import 'package:flutter/material.dart';

class DropBusiness extends StatelessWidget {
  const DropBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Organization Name"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                    iconSize: 50,
                  ),
                  Text("Drop Business"),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bar_chart),
                    iconSize: 50,
                  ),
                  Text("Statistics"),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.reviews),
                    iconSize: 50,
                  ),
                  Text("Reviews"),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}