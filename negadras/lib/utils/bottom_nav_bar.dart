import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/app.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget ownerBottomNav(BuildContext context, int i) {
  // SharedPreferences pref = await SharedPreferences.getInstance();
  // String? role = pref.getString("role");
  DataBloc bloc = BlocProvider.of<DataBloc>(context);
  String ID = bloc.state.userId;

  if (bloc.state.role == "Owner") {
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
      backgroundColor: Colors.amberAccent,
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
            activeColor: Color.fromRGBO(20, 40, 65, 1),
            inactiveColor: Colors.black),
        BottomNavyBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorites"),
            activeColor: Color.fromRGBO(20, 40, 65, 1),
            inactiveColor: Colors.black),
        BottomNavyBarItem(
            icon: Icon(Icons.manage_accounts),
            title: Text("Me"),
            activeColor: Color.fromRGBO(20, 40, 65, 1),
            inactiveColor: Colors.black)
      ],
    );
  } else {
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
      backgroundColor: Colors.amberAccent,
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
            icon: ImageIcon(
              AssetImage("assets/images/icons8-binoculars-24.png"),
              color: Color.fromRGBO(20, 40, 65, 1),
              // size: 5,
            ),
            title: Text("Discover"),
            activeColor: Color.fromRGBO(20, 40, 65, 1),
            inactiveColor: Colors.black),
        BottomNavyBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/icons8-heart-24.png"),
              color: Color.fromRGBO(20, 40, 65, 1),
              // size: 5,
            ),
            title: Text("Favorites"),
            activeColor: Color.fromRGBO(20, 40, 65, 1),
            inactiveColor: Colors.black),
        BottomNavyBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/icons8-four-squares-24.png"),
              color: Color.fromRGBO(20, 40, 65, 1),
              // size: 5
            ),
            title: Text("Organizations"),
            activeColor: Color.fromRGBO(20, 40, 65, 1),
            inactiveColor: Colors.black),
        BottomNavyBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/icons8-edit-account-50.png"),
              color: Color.fromRGBO(20, 40, 65, 1),
              // size: 5,
            ),
            title: Text("Me"),
            activeColor: Color.fromRGBO(20, 40, 65, 1),
            inactiveColor: Colors.black)
      ],
    );
  }
}

// Widget ownerBottomNav(BuildContext context, int i) {
  
// }
