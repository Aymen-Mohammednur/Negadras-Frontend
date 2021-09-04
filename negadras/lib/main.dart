import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:negadras/user/screens/account_management.dart';
// import 'package:negadras/buisness/screens/add_business.dart';
// import 'package:negadras/buisness/screens/favorites.dart';
// import 'package:negadras/buisness/screens/filter_business.dart';
// import 'package:negadras/buisness/screens/edit_business.dart';
// import 'package:negadras/user/screens/me_tab.dart';
// import 'package:negadras/app.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:negadras/routes/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusinessBloc(),
      child: MaterialApp.router(
          title: 'Negadras',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routerDelegate: AutoRouterDelegate(
            _appRouter,
            navigatorObservers: () => [AutoRouteObserver()],
          ),
          routeInformationParser: _appRouter.defaultRouteParser()),
    );
  }
}
