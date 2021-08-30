import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:negadras/SimpleBarChart.dart';


TextStyle normalText() {
  return TextStyle(
    fontSize: 24,
  );
}

Widget searchBar() {
  return Row(
    children: [
      Expanded(
        child: TextField(),
      ),
      Icon(
        Icons.search,
        color: Colors.black,
      ),
    ],
  );
}

Widget chartWidget(){
  return SizedBox(child: 
  SimpleBarChart.withSampleData(),
  height: 400
  );
}

Widget imageStackWidget() {
  return Stack(
    alignment: Alignment(0, 0.85),
    children: [
      Image.asset(
        "images/placeholder-1.jpg",
        height: 220,
        fit: BoxFit.cover,
        
        ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Business Name",
              style: normalText(),
              ),
            Text(
              "N⭐",
              style: normalText(),),
          ],
        ),
      ),
    ],
  );
}
