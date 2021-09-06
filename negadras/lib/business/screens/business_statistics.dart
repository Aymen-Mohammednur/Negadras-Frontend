import 'package:flutter/material.dart';
import 'package:negadras/business/screens/widgets.dart';

class BusinessStaticsPage extends StatefulWidget {
  BusinessStaticsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _BusinessStaticsPageState createState() => _BusinessStaticsPageState();
}

class _BusinessStaticsPageState extends State<BusinessStaticsPage> {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageStackWidget(),
              buttonPanelWidget([
                IconTextPair().edit(),
                IconTextPair().drop(),
                IconTextPair().review()
              ]),
              chartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
