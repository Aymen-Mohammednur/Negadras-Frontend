// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../business/screens/favorites.dart' as _i6;
import '../business/screens/filter_business.dart' as _i4;
import '../business/screens/my_business.dart' as _i9;
import '../business/screens/search_business.dart' as _i5;
import '../category/screens/home_page.dart' as _i3;
import '../user/screens/account_management.dart' as _i8;
import '../user/screens/me_tab.dart' as _i7;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
          return _i3.HomePage(key: args.key);
        }),
    FilterBusinessRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.FilterBusinessPage();
        }),
    SearchBusinessRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.SearchBusinessPage();
        }),
    FavoritesRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.FavoritesPage();
        }),
    MeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.MePage();
        }),
    AccountManagementRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i8.AccountManagementPage();
        }),
    MyBusinessRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i9.MyBusinessPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/'),
        _i1.RouteConfig(FilterBusinessRoute.name,
            path: '/filter-business-page'),
        _i1.RouteConfig(SearchBusinessRoute.name,
            path: '/search-business-page'),
        _i1.RouteConfig(FavoritesRoute.name, path: '/favorites-page'),
        _i1.RouteConfig(MeRoute.name, path: '/me-page'),
        _i1.RouteConfig(AccountManagementRoute.name,
            path: '/account-management-page'),
        _i1.RouteConfig(MyBusinessRoute.name, path: '/my-business-page')
      ];
}

class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i2.Key? key})
      : super(name, path: '/', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i2.Key? key;
}

class FilterBusinessRoute extends _i1.PageRouteInfo {
  const FilterBusinessRoute() : super(name, path: '/filter-business-page');

  static const String name = 'FilterBusinessRoute';
}

class SearchBusinessRoute extends _i1.PageRouteInfo {
  const SearchBusinessRoute() : super(name, path: '/search-business-page');

  static const String name = 'SearchBusinessRoute';
}

class FavoritesRoute extends _i1.PageRouteInfo {
  const FavoritesRoute() : super(name, path: '/favorites-page');

  static const String name = 'FavoritesRoute';
}

class MeRoute extends _i1.PageRouteInfo {
  const MeRoute() : super(name, path: '/me-page');

  static const String name = 'MeRoute';
}

class AccountManagementRoute extends _i1.PageRouteInfo {
  const AccountManagementRoute()
      : super(name, path: '/account-management-page');

  static const String name = 'AccountManagementRoute';
}

class MyBusinessRoute extends _i1.PageRouteInfo {
  const MyBusinessRoute() : super(name, path: '/my-business-page');

  static const String name = 'MyBusinessRoute';
}
