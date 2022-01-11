import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/business/models/business.dart';
import 'dart:convert';
import 'package:negadras/review/blocs/blocs.dart';
import 'package:negadras/review/models/models.dart';

// import 'package:negadras/SimpleBarChart.dart';
TextStyle normalText() {
  return TextStyle(
    fontSize: 24,
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
    border: Border.all(),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
}

Widget searchBar() {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Search..."),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          )
        ],
      ));
}

Widget imageStackWidget() {
  return Stack(
    alignment: Alignment(0, 0.85),
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                "Business Name",
                style: veryBigText(),
              ),
            ),
            Text(
              "N⭐",
              style: normalText(),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget iconPair(
    {required IconData icon,
    required String displayString,
    Function()? action}) {
  return GestureDetector(
    onTap: action ?? () {},
    child: Column(
      children: [
        Icon(icon, size: 40),
        Text(displayString),
      ],
    ),
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

_allReviews(List r) {
  List<Widget> l = [];
  for (int i = 0; i < r.length; i++) {
    l.add(_userReviewBox(r[i]));
  }
  return Column(
    children: l,
  );
}

Widget reviewBox(review, i) {
  var userReviewButtons = (i > 0
      ? [
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete your review',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit your review',
            onPressed: () {},
          ),
        ]
      : [Container()]);

  String name = (i == 2 ? "Your Review" : review.username);
  String content = review.reviewText;
  String rating = review.rating.toString();
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
              children: userReviewButtons,
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

Widget handleReviewState(state, context, businessId) {
  print("STATEEEEEEEEEEEEEEEEEEe");
  print(state);

  if (state is ReviewInitial) {
    BlocProvider.of<ReviewBloc>(context).add(PageOpen(businessId, ""));
  }
  if (state is ReviewOperationFaliure) {
    return Container(
      child: Center(child: Text("Some error occured")),
    );
  } else if (state is ReviewPageLoaded) {
    print("REVIEW LISTTT: ${state.reviewList}");
    // if (state.businessId)
    return _allReviews(state.reviewList);
  } else {
    return Container(child: Text("Loading Reviews..."));
  }
}

class IconTextPair {
  String? url;
  IconTextPair({this.url});
  Widget claim({String s = "Claim", Function()? todo}) =>
      iconPair(icon: Icons.add_circle, displayString: s, action: todo);
  Widget edit({String s = "Edit", Function()? todo}) =>
      iconPair(icon: Icons.edit, displayString: s, action: todo);
  Widget drop({String s = "Drop", Function()? todo}) =>
      iconPair(icon: Icons.delete, displayString: s, action: todo);
  Widget review({String s = "Reviews", Function()? todo}) =>
      iconPair(icon: Icons.reviews, displayString: s, action: todo);
  Widget website({String s = "Website", Function()? todo}) =>
      iconPair(icon: Icons.language, displayString: s, action: todo);
  Widget map({String s = "Open Maps", Function()? todo}) =>
      iconPair(icon: Icons.location_on, displayString: s, action: todo);
  Widget call({String s = "Call", Function()? todo}) =>
      iconPair(icon: Icons.phone, displayString: s, action: todo);
  Widget stats({String s = "Statistics", Function()? todo}) =>
      iconPair(icon: Icons.signal_cellular_alt, displayString: s, action: todo);
}
