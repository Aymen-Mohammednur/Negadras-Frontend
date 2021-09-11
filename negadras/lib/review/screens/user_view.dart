import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:negadras/business/screens/favorites.dart';
// import 'package:negadras/business/screens/my_business.dart';
import 'package:negadras/review/screens/widgets.dart';
import 'package:negadras/review/blocs/blocs.dart';
import 'package:negadras/review/screens/widgets/widgets.dart';
import 'package:negadras/user/screens/me_tab.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';
// import 'package:negadras/review/scre'

class UserViewPage extends StatefulWidget {
  const UserViewPage({Key? key}) : super(key: key);

  // const UserViewPage(this.businessId, this.userId, {Key? key}) : super(key: key);
  // final String businessId;
  // final String userId;

  @override
  UserViewPageState createState() {
    UserViewPageState s = UserViewPageState();
    s.businessId = "6139de58b8c03ed2137941fc";
    s.userId = "";
    return s;
  }
}

class UserViewPageState extends State<UserViewPage> {
  late String businessId;
  late String userId;
  bool _floatingActionIsVisible = false;
  @override
  Widget build(BuildContext context) {
    var _scrollController = ScrollController();
    BlocProvider.of<ReviewBloc>(context).add(PageOpen(businessId, userId));
    return Scaffold(
      appBar: AppBar(
        title: Text("Business Details"),
      ),
      body: NotificationListener(
        child: ListView(
          shrinkWrap: true,
          controller: _scrollController,
          children: [
                imageStackWidget(),
                buttonPanelWidget([
                  IconTextPair().call(),
                  IconTextPair().website(),
                  IconTextPair().claim()
                ]),
                BlocBuilder<UserReviewBloc, UserReviewState>(
                  builder: (context, state) =>
                      UserReviewPromptClass(context, businessId, userId)
                          .UserReviewPrompt(),
                ),
              ] +
              [
                BlocBuilder<ReviewBloc, ReviewState>(
                  builder: (context, state) => handleReviewState(state),
                ),
              ],
        ),
        onNotification: (ping) {
          return scrollToTopWidgetMaker(ping, _scrollController);
        },
      ),
      // bottomNavigationBar: bottomNav(context),
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
