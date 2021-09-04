import 'package:flutter/material.dart';
import 'package:negadras/buisness/screens/widgets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: searchBar(),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text("What are you looking for...", style: normalText()),
            ),
            Expanded(flex: 3, child: businessType()),
            Expanded(
              flex: 2,
              child: Center(child: Text(textString)),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
