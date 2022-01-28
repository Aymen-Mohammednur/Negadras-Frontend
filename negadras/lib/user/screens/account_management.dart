import 'package:flutter/material.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';
import '../../business/screens/widgets/label.dart';

class AccountManagementPage extends StatelessWidget {
  const AccountManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromRGBO(20, 40, 65, 1), //change your color here
        ),
        backgroundColor: Colors.amberAccent,
        title: Text(
          "Account",
          style: TextStyle(color: Color.fromRGBO(20, 40, 65, 1)),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromRGBO(20, 40, 65, 1),
      // bottomNavigationBar: bottomNav(context, 2),
      bottomNavigationBar: ownerBottomNav(context, 3),
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
                      image: AssetImage('assets/images/avatar.png'),
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                  child: Label(
                label: "Account Management",
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
                fontColor: Colors.amberAccent,
              ))
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () => {context.router.push(ChangeUsernameRoute())},
                child: Card(
                  color: Color.fromRGBO(20, 40, 65, 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: ImageIcon(
                          AssetImage("assets/images/icons8-person-24.png"),
                          color: Colors.amberAccent,
                        ),
                        title: Text(
                          'Change Username',
                          style: TextStyle(
                              fontSize: 20, color: Colors.amberAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {context.router.push(ChangePasswordRoute())},
                child: Card(
                  color: Color.fromRGBO(20, 40, 65, 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: ImageIcon(
                          AssetImage("assets/images/icons8-password-24.png"),
                          color: Colors.amberAccent,
                        ),
                        title: Text(
                          'Change Password',
                          style: TextStyle(
                              fontSize: 20, color: Colors.amberAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {context.router.push(DeleteAccountRoute())},
                child: Card(
                  color: Color.fromRGBO(20, 40, 65, 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: ImageIcon(
                          AssetImage("assets/images/icons8-delete-64.png"),
                          color: Colors.amberAccent,
                        ),
                        title: Text(
                          'Delete Account',
                          style: TextStyle(
                              fontSize: 20, color: Colors.amberAccent),
                        ),
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
