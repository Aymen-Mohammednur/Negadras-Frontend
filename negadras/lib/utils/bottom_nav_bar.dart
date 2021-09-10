import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';

Widget bottomNav(BuildContext context, int i) {
  Map<String, int> pageIndex = {"/": 0, "/favorites-page": 1, "/me-page": 2};
  String routeName = context.routeData.path;
  int currentIndex = pageIndex[routeName] ?? 0;
  print(i);

  List routes = [
    HomeRoute(),
    FavoritesRoute(),
    MeRoute(),
  ];

  return BottomNavyBar(
    // animationDuration: Duration(milliseconds: 500),
    curve: Curves.easeInOut,
    selectedIndex: i,
    onItemSelected: (index) {
      // context.router.push(routes[index]);
      // context.router.popUntilRoot();
      context.router.popUntilRoot();
      context.router.replace(routes[index]);
    },

    items: [
      BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text("Discover"),
          activeColor: Colors.green.shade900,
          inactiveColor: Colors.black),
      BottomNavyBarItem(
          icon: Icon(Icons.favorite),
          title: Text("Favorites"),
          activeColor: Colors.green.shade900,
          inactiveColor: Colors.black),
      BottomNavyBarItem(
          icon: Icon(Icons.manage_accounts),
          title: Text("Me"),
          activeColor: Colors.green.shade900,
          inactiveColor: Colors.black)
    ],
  );
}

Widget ownerBottomNav(BuildContext context, int i) {
  Map<String, int> pageIndex = {
    "/": 0,
    "/favorites-page": 1,
    "/list-organization-page": 2,
    "/me-page": 3
  };
  String routeName = context.routeData.path;
  int currentIndex = pageIndex[routeName] ?? 0;
  print(i);

  List routes = [
    HomeRoute(),
    FavoritesRoute(),
    ListOrganizationRoute(),
    MeRoute(),
  ];

  return BottomNavyBar(
    // animationDuration: Duration(milliseconds: 500),
    curve: Curves.easeInOut,
    selectedIndex: i,
    onItemSelected: (index) {
      // context.router.push(routes[index]);
      // context.router.popUntilRoot();
      context.router.popUntilRoot();
      context.router.replace(routes[index]);
    },

    items: [
      BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text("Discover"),
          activeColor: Colors.green.shade900,
          inactiveColor: Colors.black),
      BottomNavyBarItem(
          icon: Icon(Icons.favorite),
          title: Text("Favorites"),
          activeColor: Colors.green.shade900,
          inactiveColor: Colors.black),
      BottomNavyBarItem(
          icon: Icon(Icons.account_balance),
          title: Text("Organizations"),
          activeColor: Colors.green.shade900,
          inactiveColor: Colors.black),
      BottomNavyBarItem(
          icon: Icon(Icons.manage_accounts),
          title: Text("Me"),
          activeColor: Colors.green.shade900,
          inactiveColor: Colors.black)
    ],
  );
}
