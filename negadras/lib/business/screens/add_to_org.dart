import 'package:flutter/material.dart';
import 'package:negadras/business/screens/widgets.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';

class ListOrganizationPage extends StatefulWidget {
  ListOrganizationPage({Key? key}) : super(key: key);

  @override
  _ListOrganizationPageState createState() => _ListOrganizationPageState();
}

class _ListOrganizationPageState extends State<ListOrganizationPage> {
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
      bottomNavigationBar: BottomNav(context),
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
