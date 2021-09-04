import 'package:flutter/material.dart';
import 'package:negadras/buisness/screens/widgets.dart';

class ListOrganizationPage extends StatefulWidget {
  ListOrganizationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ListOrganizationPage> {
  Row singleOrgEntry(int i) {
    return Row(children: [
      Expanded(
        child: Text(
          "Organization $i",
          style: normalText(),
        ),
      ),
      Icon(Icons.delete),
      Icon(Icons.edit)
    ]);
  }

  ListView getLV() {
    return ListView.builder(itemBuilder: (context, i) {
      return Container(
          height: 40,
          decoration: listItemDecoration(),
          child: singleOrgEntry(i),
          padding: EdgeInsets.only(left: 15, right: 15),
          margin: EdgeInsets.only(bottom: 5, top: 5, left: 13, right: 13));
    });
  }

  Widget switchButton =
      ElevatedButton(onPressed: () {}, child: Text("My Businesses"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            switchButton,
            Container(child: getLV(), width: 400, height: 700),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}