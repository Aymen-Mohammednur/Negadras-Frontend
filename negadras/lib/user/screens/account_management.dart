import 'package:flutter/material.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';
import '../../business/screens/widgets/label.dart';

class AccountManagementPage extends StatelessWidget {
  const AccountManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(context),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 60, 20, 10),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage('assets/images/hacker.jpeg'),
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                  child: Label(
                label: "Account Management",
                fontStyle: FontStyle.normal,
                fontSize: 15.0,
              ))
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () => {},
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Change Username'),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {},
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.pin_drop_outlined),
                        title: Text('Change Password'),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {},
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.home_filled),
                        title: Text('Delete Account'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
