import 'package:flutter/material.dart';
// import 'package:negadras/user/screens/account_management.dart';
// import 'package:negadras/buisness/screens/add_business.dart';
// import 'package:negadras/buisness/screens/favorites.dart';
// import 'package:negadras/buisness/screens/filter_business.dart';
// import 'package:negadras/buisness/screens/edit_business.dart';
// import 'package:negadras/user/screens/me_tab.dart';
import 'package:negadras/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: App());

  }
}
