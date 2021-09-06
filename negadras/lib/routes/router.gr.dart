// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../business/screens/add_business.dart' as _i16;
import '../business/screens/edit_business.dart' as _i17;
import '../business/screens/favorites.dart' as _i6;
import '../business/screens/filter_business.dart' as _i4;
import '../business/screens/my_business.dart' as _i9;
import '../business/screens/search_business.dart' as _i5;
import '../category/screens/home_page.dart' as _i3;
import '../review/screens/user_view.dart' as _i10;
import '../user/screens/account_management.dart' as _i8;
import '../user/screens/changepassword.dart' as _i15;
import '../user/screens/changeusername.dart' as _i14;
import '../user/screens/deleteaccount.dart' as _i13;
import '../user/screens/me_tab.dart' as _i7;
import '../auth/screens/signin.dart' as _i12;
import '../auth/screens/signup.dart' as _i11;

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
        }),
    UserViewRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.UserViewPage();
        }),
    SignUpRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.SignUpPage();
        }),
    SignInRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.SignInPage();
        }),
    DeleteAccountRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i13.DeleteAccountPage();
        }),
    ChangeUsernameRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i14.ChangeUsernamePage();
        }),
    ChangePasswordRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i15.ChangePasswordPage();
        }),
    AddBusinessRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i16.AddBusinessPage();
        }),
    EditBusinessRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i17.EditBusinessPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i1.RouteConfig(FilterBusinessRoute.name,
            path: '/filter-business-page'),
        _i1.RouteConfig(SearchBusinessRoute.name,
            path: '/search-business-page'),
        _i1.RouteConfig(FavoritesRoute.name, path: '/favorites-page'),
        _i1.RouteConfig(MeRoute.name, path: '/me-page'),
        _i1.RouteConfig(AccountManagementRoute.name,
            path: '/account-management-page'),
        _i1.RouteConfig(MyBusinessRoute.name, path: '/my-business-page'),
        _i1.RouteConfig(UserViewRoute.name, path: '/user-view-page'),
        _i1.RouteConfig(SignUpRoute.name, path: '/'),
        _i1.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i1.RouteConfig(DeleteAccountRoute.name, path: '/delete-account-page'),
        _i1.RouteConfig(ChangeUsernameRoute.name,
            path: '/change-username-page'),
        _i1.RouteConfig(ChangePasswordRoute.name,
            path: '/change-password-page'),
        _i1.RouteConfig(AddBusinessRoute.name, path: '/add-business-page'),
        _i1.RouteConfig(EditBusinessRoute.name, path: '/edit-business-page')
      ];
}

class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i2.Key? key})
      : super(name, path: '/home-page', args: HomeRouteArgs(key: key));

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

class UserViewRoute extends _i1.PageRouteInfo {
  const UserViewRoute() : super(name, path: '/user-view-page');

  static const String name = 'UserViewRoute';
}

class SignUpRoute extends _i1.PageRouteInfo {
  const SignUpRoute() : super(name, path: '/');

  static const String name = 'SignUpRoute';
}

class SignInRoute extends _i1.PageRouteInfo {
  const SignInRoute() : super(name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

class DeleteAccountRoute extends _i1.PageRouteInfo {
  const DeleteAccountRoute() : super(name, path: '/delete-account-page');

  static const String name = 'DeleteAccountRoute';
}

class ChangeUsernameRoute extends _i1.PageRouteInfo {
  const ChangeUsernameRoute() : super(name, path: '/change-username-page');

  static const String name = 'ChangeUsernameRoute';
}

class ChangePasswordRoute extends _i1.PageRouteInfo {
  const ChangePasswordRoute() : super(name, path: '/change-password-page');

  static const String name = 'ChangePasswordRoute';
}

class AddBusinessRoute extends _i1.PageRouteInfo {
  const AddBusinessRoute() : super(name, path: '/add-business-page');

  static const String name = 'AddBusinessRoute';
}

class EditBusinessRoute extends _i1.PageRouteInfo {
  const EditBusinessRoute() : super(name, path: '/edit-business-page');

  static const String name = 'EditBusinessRoute';
}
