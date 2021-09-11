import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/app.dart';
// import 'package:negadras/business/screens/favorites.dart';
// import 'package:negadras/business/screens/my_business.dart';
import 'package:negadras/review/screens/widgets.dart';
import 'package:negadras/review/blocs/blocs.dart';
import 'package:negadras/review/screens/widgets/widgets.dart';
import 'package:negadras/user/data_providers/data_providers.dart';
import 'package:negadras/user/repository/user_repository.dart';
import 'package:negadras/user/screens/me_tab.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:negadras/review/scre'

class UserViewPage extends StatefulWidget {
  // const UserViewPage({Key? key}) : super(key: key);

  // const UserViewPage(this.businessId, this.userId, {Key? key}) : super(key: key);
  // final String businessId;
  // final String userId;

  const UserViewPage(
      this.businessId, this.businessName, this.businessPhone, this.businessWeb,
      {Key? key})
      : super(key: key);
  final String businessId;
  // final String userId;
  final String businessName;
  final String businessPhone;
  final String businessWeb;

  @override
  UserViewPageState createState() => UserViewPageState();
}

class UserViewPageState extends State<UserViewPage> {
  @override
  void initState() {
    print("In init state");
    Future.delayed(Duration.zero).then((value) {
      ReviewBloc reviewBloc = BlocProvider.of<ReviewBloc>(context);
      UserReviewBloc userReviewBloc = BlocProvider.of<UserReviewBloc>(context);
      reviewBloc.add(NormalReviewEvent());
      userReviewBloc.add(InitialUser());
      print(widget.businessId);
    });
    print("before super.init");
    super.initState();
  }

  late String businessId;
  late String userId;
  late String businessUrl;
  late String businessPhone;
  bool _floatingActionIsVisible = false;
  @override
  Widget build(BuildContext context) {
    var _scrollController = ScrollController();
    BlocProvider.of<ReviewBloc>(context).add(PageOpen(widget.businessId, ""));
    DataBloc bloc = BlocProvider.of<DataBloc>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.amberAccent, //change your color here
        ),
        title: Text("Business Details",
            style: TextStyle(color: Colors.amberAccent)),
        backgroundColor: Color.fromRGBO(20, 40, 65, 1),
      ),
      body: NotificationListener(
        child: ListView(
          shrinkWrap: true,
          controller: _scrollController,
          children: [
                imageStackWidget(),
                buttonPanelWidget([
                  IconTextPair().call(todo: () {
                    launch("tel://123123");
                  }),
                  IconTextPair().website(todo: () {
                    launch("https://$businessUrl");
                  }),
                  IconTextPair().claim(todo: () {
                    UserDataProvider userDataProvider = UserDataProvider();
                    UserRepository userRepository =
                        UserRepository(dataProvider: userDataProvider);
                    userRepository.makeClaim(
                        bloc.state.userId, widget.businessId);
                    print("CLAIMEDDDDDDDDDDD");
                  })
                  // IconButton(
                  //   onPressed: () {
                  //     UserDataProvider userDataProvider = UserDataProvider();
                  //     UserRepository userRepository =
                  //         UserRepository(dataProvider: userDataProvider);
                  //     userRepository.makeClaim(
                  //         bloc.state.userId, widget.businessId);
                  //     print("CLAIMEDDDDDDDDDDD");
                  //   },
                  //   icon: Icon(
                  //     Icons.add_circle,
                  //     size: 30,
                  //   ),
                  // )
                ]),
                BlocBuilder<UserReviewBloc, UserReviewState>(
                  builder: (context, state) =>
                      UserReviewPromptClass(context, widget.businessId, "")
                          .UserReviewPrompt(),
                ),
              ] +
              [
                BlocBuilder<ReviewBloc, ReviewState>(
                  builder: (context, state) =>
                      handleReviewState(state, context, widget.businessId),
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
