import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:negadras/SimpleBarChart.dart';

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

