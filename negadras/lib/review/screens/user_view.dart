import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/business/screens/favorites.dart';
import 'package:negadras/business/screens/my_business.dart';
import 'package:negadras/business/screens/widgets.dart';
import 'package:negadras/review/blocs/review_bloc.dart';
import 'package:negadras/review/screens/widgets/widgets.dart';
import 'package:negadras/user/screens/me_tab.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';
// import 'package:negadras/review/scre'

class UserViewPage extends StatefulWidget {
  const UserViewPage({Key? key}) : super(key: key);

  @override
  UserViewPageState createState() => UserViewPageState();
}

class UserViewPageState extends State<UserViewPage> {
  bool _floatingActionIsVisible = false;
  @override
  Widget build(BuildContext context) {
    var _scrollController = ScrollController();
    return BlocProvider(
      create: (context) => ReviewBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Business Details"),
        ),
        body: Center(
          child: NotificationListener(
            child: ListView(
              controller: _scrollController,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageStackWidget(),
                buttonPanelWidget([
                  IconTextPair().call(),
                  IconTextPair().map(),
                  IconTextPair().website()
                ]),
                BlocBuilder<ReviewBloc, ReviewState>(
                  builder: (context, state) => UserReviewPrompt(context),
                ),
                userReviewList(1),
              ],
            ),
            onNotification: (ping) {
              return scrollToTopWidgetMaker(ping, _scrollController);
            },
          ),
        ),
        bottomNavigationBar: BottomNav(context),
        floatingActionButton: Visibility(
          visible: _floatingActionIsVisible,
          child: FloatingActionButton(
            focusColor: Colors.yellow,
            focusElevation: 40,
            onPressed: () {
              _scrollController.animateTo(3,
                  duration: Duration(milliseconds: 600),
                  curve: Curves.bounceInOut);
            },
            child: Icon(Icons.arrow_circle_up_rounded),
          ),
        ),
      ),
    );
  }

  bool scrollToTopWidgetMaker(
      Object? ping, ScrollController _scrollController) {
    if (ping is ScrollEndNotification) {
      if (_scrollController.position.pixels > 360)
        setState(() {
          _floatingActionIsVisible = true;
        });
      else
        setState(() {
          _floatingActionIsVisible = false;
        });
    } else if (ping is ScrollUpdateNotification) {
      print("Scrolling");
    }
    return true;
  }
}
