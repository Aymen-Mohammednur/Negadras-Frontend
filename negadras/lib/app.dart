import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:negadras/business/screens/favorites.dart';
import 'package:negadras/category/screens/home_page.dart';
import 'package:negadras/user/screens/me_tab.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int currentIndex = 0;

  List<Widget> listOfPages = [
    HomePage(),
    FavoritesPage(),
    MePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Negadras",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: listOfPages,
      ),
      bottomNavigationBar: BottomNavyBar(
        // animationDuration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
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
      ),
    );
  }
}
