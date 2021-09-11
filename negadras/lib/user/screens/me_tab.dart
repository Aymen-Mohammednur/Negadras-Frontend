import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/app.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';
import '../../business/screens/widgets/label.dart';
import 'package:auto_route/auto_route.dart';

class MePage extends StatelessWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataBloc bloc = BlocProvider.of<DataBloc>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text(
            "Me",
            style: TextStyle(color: Color.fromRGBO(20, 40, 65, 1)),
          ),
          centerTitle: true,
        ),
        backgroundColor: Color.fromRGBO(20, 40, 65, 1),
        // bottomNavigationBar: bottomNav(context, 2),
        bottomNavigationBar: ownerBottomNav(context, 3) as Widget,
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
                  label: bloc.state.username,
                  fontStyle: FontStyle.normal,
                  fontSize: 22.0,
                  fontColor: Colors.amberAccent,
                ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => {
                    context.router.push(AccountManagementRoute()),
                  },
                  child: Card(
                    color: Color.fromRGBO(20, 40, 65, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const ListTile(
                          leading: ImageIcon(
                            AssetImage("assets/images/icons8-person-24.png"),
                            color: Colors.amberAccent,
                          ),
                          title: Text(
                            'Account Management',
                            style: TextStyle(
                                fontSize: 20, color: Colors.amberAccent),
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: Colors.amberAccent.withOpacity(0.7),
                            width: 100)),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    context.router.push(FavoritesRoute()),
                  },
                  child: Card(
                      child: Container(
                        // height: 50,
                        // width: 300,
                        color: Color.fromRGBO(20, 40, 65, 1),
                        child: ListTile(
                          leading: ImageIcon(
                            AssetImage(
                                "assets/images/icons8-location-pin-64.png"),
                            color: Colors.amberAccent,
                          ),
                          title: Text('Favorite Places',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.amberAccent)),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                              color: Colors.amberAccent.withOpacity(0.7),
                              width: 100))),
                ),
                // GestureDetector(
                //   onTap: () => {},
                //   child: Card(
                //     child: Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: <Widget>[
                //         const ListTile(
                //           leading: Icon(Icons.home_filled),
                //           title: Text('Claim A Business'),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () => {
                    // context.router.popUntilRoot(),
                    // context.router.push(LoginRoute()),
                    context.router.pushAndPopUntil(LoginRoute(),
                        predicate: (route) => false),
                  },
                  child: Card(
                    color: Color.fromRGBO(20, 40, 65, 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: ImageIcon(
                            AssetImage("assets/images/icons8-sign-out-50.png"),
                            color: Colors.amberAccent,
                          ),
                          title: Text('Logout',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.amberAccent)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )));
  }
}
