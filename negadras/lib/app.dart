import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:wakelock/wakelock.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // This prevents mobile phone screen from turning off while debugging @Semere T
    Wakelock.enable();

    return BlocProvider(
      create: (context) => BusinessBloc(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerDelegate: AutoRouterDelegate(
          _appRouter,
          navigatorObservers: () => [AutoRouteObserver()],
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
