import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:negadras/buisness/screens/SimpleBarChart.dart';
// import 'package:negadras/SimpleBarChart.dart';

TextStyle normalText() {
  return TextStyle(
    fontSize: 24,
  );
}

BoxDecoration listItemDecoration() {
  return BoxDecoration(
    border: Border.all(),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
}

BoxDecoration gridItemDecoration() {
  return BoxDecoration(
    border: Border.all(),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
}

Widget searchBar() {
  return Row(
    children: [
      // SizedBox(
      //   width: 200,
      //   child: Expanded(child: TextField(),)
      // ),
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

Widget iconPair(IconData icon,String displayString){
  return Column(children: [
    Icon(icon, size: 40),
    Text(displayString),
  ],);
}


Widget _iconRow(){
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
      iconPair(Icons.edit, "Edit"),
      iconPair(Icons.delete, "Drop Business"),
      iconPair(Icons.reviews, "Reviews"),
      
    ],),
  );
}

Widget buttonPanelWidget(){
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
            SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left:10),
          child: Text(
            "Organization Name",
            style: normalText(),
            ),
        ),
            SizedBox(height: 10,),
        _iconRow(),
      ]
    ),
  );
}
Widget chartWidget(){
  return SizedBox(child: 
  SimpleBarChart.withSampleData(),
  height: 400
  );
}


