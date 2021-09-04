import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:negadras/routes/router.gr.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
