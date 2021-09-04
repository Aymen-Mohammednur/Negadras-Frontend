import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:negadras/buisness/screens/edit_business.dart';
import 'package:negadras/buisness/screens/favorites.dart';
import 'package:negadras/buisness/screens/my_business.dart';
import 'package:negadras/category/screens/home_page.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:negadras/user/screens/me_tab.dart';
import 'package:auto_route/auto_route.dart';

Widget BottomNav(BuildContext context) {

  Map<String, int> pageIndex = {"/": 0, "/favorites-page": 1, "/me-page": 2};
  String routeName = context.routeData.path;
  int currentIndex = pageIndex[routeName] ?? 0;

  List routes = [
    HomeRoute(),
    FavoritesRoute(),
    MeRoute(),
  ];

  return BottomNavyBar(
    // animationDuration: Duration(milliseconds: 500),
    curve: Curves.easeInOut,
    selectedIndex: currentIndex,
    onItemSelected: (index) {
      context.router.push(routes[index]);
    },

    items: [
      BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text("Discover"),
          activeColor: Colors.blueAccent,
          inactiveColor: Colors.black),
      BottomNavyBarItem(
          icon: Icon(Icons.favorite),
          title: Text("Favorites"),
          activeColor: Colors.blueAccent,
          inactiveColor: Colors.black),
      BottomNavyBarItem(
          icon: Icon(Icons.manage_accounts),
          title: Text("Me"),
          activeColor: Colors.blueAccent,
          inactiveColor: Colors.black)
    ],
  );
}
