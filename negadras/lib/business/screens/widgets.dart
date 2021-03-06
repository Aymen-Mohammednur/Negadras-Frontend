import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/services.dart';
// import 'package:negadras/business/screens/SimpleBarChart.dart';
import 'dart:convert';

// import 'package:negadras/SimpleBarChart.dart';
TextStyle normalText() {
  return TextStyle(
    fontSize: 24,
    color: Colors.amberAccent,
  );
}

TextStyle smallText() {
  return TextStyle(
    fontSize: 20,
  );
}

TextStyle verySmallText() {
  return TextStyle(
    fontSize: 18,
  );
}

TextStyle bigText() {
  return TextStyle(
    fontSize: 28,
  );
}

TextStyle veryBigText() {
  return TextStyle(
    fontSize: 30,
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
    border: Border.all(color: Colors.amberAccent),
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
  // return Expanded(
  //   child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Row(
  //         children: [
  //           TextField(
  //             decoration: InputDecoration(hintText: "Search..."),
  //           ),
  //           IconButton(
  //             onPressed: () {},
  //             icon: Icon(Icons.search, color: Colors.black),
  //           )
  //         ],
  //       )),
  // );
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
              "N???",
              style: normalText(),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget iconPair(IconData icon, String displayString) {
  return Column(
    children: [
      Icon(icon, size: 40),
      Text(displayString),
    ],
  );
}

Widget _iconRow(iconPairList) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: iconPairList,
    ),
  );
}

Widget buttonPanelWidget(iconPairList) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          "Organization Name",
          style: normalText(),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      _iconRow(iconPairList),
    ]),
  );
}

Widget _businessReviewBox(r) {
  return reviewBox(r, 1);
}

Widget _userReviewBox(r) {
  return reviewBox(r, 0);
}

Widget reviewBox(r, i) {
  var businessOwnerButtons = (i > 0
      ? [
          Icon(Icons.reply_outlined),
          Icon(Icons.flag),
        ]
      : [Container()]);

  var review = jsonDecode(r);
  String name = review["name"];
  String content = review["content"];
  String rating = review["rating"];
  // String? ownerReply = review["reply"];

  return Padding(
    padding: const EdgeInsets.only(top: 3, left: 10, right: 10),
    child: Container(
      // decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.face),
              ),
              Text(name),
              SizedBox(width: 5),
              Text(rating),
              Icon(Icons.star),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Text(content),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: businessOwnerButtons,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget businessReviewList(reviewList) {
  String dummyJson = '{"name": "Adam Smith", "content": "I love this place"}';
  return ListView.builder(
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return _businessReviewBox(dummyJson);
      });
}

List<Widget> userReviewList(reviewList) {
  String dummyJson =
      '{"name": "Adam Smith", "content": "I love this place", "rating": "3.3"}';
  return List<Widget>.generate(10, (i) {
    return _userReviewBox(dummyJson);
  });
}

class IconTextPair {
  Widget claim({String s = "Claim"}) => iconPair(Icons.add_circle, s);
  Widget edit({String s = "Edit"}) => iconPair(Icons.edit, s);
  Widget drop({String s = "Drop"}) => iconPair(Icons.delete, s);
  Widget review({String s = "Reviews"}) => iconPair(Icons.reviews, s);
  Widget website({String s = "Website"}) => iconPair(Icons.language, s);
  Widget map({String s = "Open Maps"}) => iconPair(Icons.location_on, s);
  Widget call({String s = "Call"}) => iconPair(Icons.phone, s);
  Widget stats({String s = "Statistics"}) =>
      iconPair(Icons.signal_cellular_alt, s);
}
