import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:negadras/business/screens/favorites.dart';
import 'package:negadras/business/screens/my_business.dart';
import 'package:negadras/business/screens/widgets.dart';
import 'package:negadras/user/screens/me_tab.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Widget businessType() => GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          9,
          (index) {
            return GestureDetector(
                onTap: () => setText(
                    "Item $index\n(To show the icons listen for events)"),
                onDoubleTap: () => setText(""),
                child: _businessTypeContainer(index));
          },
        ),
      );

  Container _businessTypeContainer(int index) {
    return Container(
        decoration: gridItemDecoration(),
        child: Center(child: Text("Item $index")),
        margin: EdgeInsets.all(10));
  }

  String textString = "";

  void setText(String s) {
    textString = s;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business Details"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageStackWidget(),
            buttonPanelWidget([
              IconTextPair().edit(),
              IconTextPair().drop(),
              IconTextPair().stats()
            ]),
            Expanded(child: businessReviewList(2)),
          ],
        ),
      ),
    );
  }
}
