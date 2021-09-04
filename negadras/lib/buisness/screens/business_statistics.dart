import 'package:flutter/material.dart';
import 'package:negadras/buisness/screens/widgets.dart';

class BusinessStaticsPage extends StatefulWidget {
  BusinessStaticsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BusinessStaticsPage> {
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
              buttonPanelWidget(),
              chartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
