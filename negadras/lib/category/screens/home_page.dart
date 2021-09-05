import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:negadras/business/screens/widgets.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget businessFilterButton(BuildContext context) {
    var bloc = BlocProvider.of<BusinessBloc>(context);
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        9,
        (index) {
          return GestureDetector(
            onTap: () {
              bloc.add(SearchBusinesses());
              context.pushRoute(FilteredBusinessRoute());
            },
            child: _businessTypeContainer(index),
          );
        },
      ),
    );
  }

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
    // final businessBloc = BlocProvider.of<BusinessBloc>(context);

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
            Expanded(flex: 3, child: businessFilterButton(context)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add a new Business',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNav(context),
    );
  }
}
