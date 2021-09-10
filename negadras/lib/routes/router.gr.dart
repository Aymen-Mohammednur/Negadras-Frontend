// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/cupertino.dart' as _i20;
import 'package:flutter/material.dart' as _i2;

import '../auth/login/login_view.dart' as _i12;
import '../auth/signup/sign_up_view.dart' as _i11;
import '../business/screens/add_business.dart' as _i16;
import '../business/screens/business_owner_view.dart' as _i20;
import '../business/screens/edit_business.dart' as _i17;
import '../business/screens/favorites_page.dart' as _i6;
import '../business/screens/filter_business.dart' as _i4;
import '../business/screens/my_business.dart' as _i9;
import '../business/screens/search_business.dart' as _i5;
import '../category/screens/home_page.dart' as _i3;
import '../organization/screens/add_organization.dart' as _i18;
import '../organization/screens/list_organization_page.dart' as _i19;
import '../review/screens/user_view.dart' as _i10;
import '../user/screens/account_management.dart' as _i8;
import '../user/screens/changepassword.dart' as _i15;
import '../user/screens/changeusername.dart' as _i14;
import '../user/screens/deleteaccount.dart' as _i13;
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
        builder: (data) {
          final args = data.argsAs<FilterBusinessRouteArgs>(
              orElse: () => const FilterBusinessRouteArgs());
          return _i4.FilterBusinessPage(
              key: args.key,
              categoryId: args.categoryId,
              queryParameter: args.queryParameter);
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
        builder: (data) {
          final args = data.argsAs<UserViewRouteArgs>();
          return _i10.UserViewPage(key: args.key, businessId: args.businessId);
        }),
    SignUpRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SignUpRouteArgs>(
              orElse: () => const SignUpRouteArgs());
          return _i11.SignUpPage(key: args.key);
        }),
    LoginRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<LoginRouteArgs>(orElse: () => const LoginRouteArgs());
          return _i12.LoginPage(key: args.key);
        }),
    DeleteAccountRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i13.DeleteAccountPage();
        }),
    ChangeUsernameRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ChangeUsernameRouteArgs>(
              orElse: () => const ChangeUsernameRouteArgs());
          return _i14.ChangeUsernamePage(key: args.key);
        }),
    ChangePasswordRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ChangePasswordRouteArgs>(
              orElse: () => const ChangePasswordRouteArgs());
          return _i15.ChangePasswordPage(key: args.key);
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
        }),
    AddOrganizationRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<AddOrganizationRouteArgs>(
              orElse: () => const AddOrganizationRouteArgs());
          return _i18.AddOrganizationPage(key: args.key);
        }),
    ListOrganizationRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ListOrganizationRouteArgs>(
              orElse: () => const ListOrganizationRouteArgs());
          return _i19.ListOrganizationPage(key: args.key);
        }),
    BusinessOwnerViewRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i20.BusinessOwnerViewPage();
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
        _i1.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i1.RouteConfig(DeleteAccountRoute.name, path: '/delete-account-page'),
        _i1.RouteConfig(ChangeUsernameRoute.name,
            path: '/change-username-page'),
        _i1.RouteConfig(ChangePasswordRoute.name,
            path: '/change-password-page'),
        _i1.RouteConfig(AddBusinessRoute.name, path: '/add-business-page'),
        _i1.RouteConfig(EditBusinessRoute.name, path: '/edit-business-page'),
        _i1.RouteConfig(AddOrganizationRoute.name,
            path: '/add-organization-page'),
        _i1.RouteConfig(ListOrganizationRoute.name,
            path: '/list-organization-page'),
        _i1.RouteConfig(BusinessOwnerViewRoute.name,
            path: '/business-owner-view-page')
      ];
}

class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i20.Key? key})
      : super(name, path: '/home-page', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i20.Key? key;
}

class FilterBusinessRoute extends _i1.PageRouteInfo<FilterBusinessRouteArgs> {
  FilterBusinessRoute(
      {_i20.Key? key, String? categoryId, String? queryParameter})
      : super(name,
            path: '/filter-business-page',
            args: FilterBusinessRouteArgs(
                key: key,
                categoryId: categoryId,
                queryParameter: queryParameter));

  static const String name = 'FilterBusinessRoute';
}

class FilterBusinessRouteArgs {
  const FilterBusinessRouteArgs(
      {this.key, this.categoryId, this.queryParameter});

  final _i20.Key? key;

  final String? categoryId;

  final String? queryParameter;
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

class UserViewRoute extends _i1.PageRouteInfo<UserViewRouteArgs> {
  UserViewRoute({_i20.Key? key, required String businessId})
      : super(name,
            path: '/user-view-page',
            args: UserViewRouteArgs(key: key, businessId: businessId));

  static const String name = 'UserViewRoute';
}

class UserViewRouteArgs {
  const UserViewRouteArgs({this.key, required this.businessId});

  final _i20.Key? key;

  final String businessId;
}

class SignUpRoute extends _i1.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({_i2.Key? key})
      : super(name, path: '/', args: SignUpRouteArgs(key: key));

  static const String name = 'SignUpRoute';
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i20.Key? key;
}

class LoginRoute extends _i1.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i2.Key? key})
      : super(name, path: '/login-page', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i20.Key? key;
}

class DeleteAccountRoute extends _i1.PageRouteInfo {
  const DeleteAccountRoute() : super(name, path: '/delete-account-page');

  static const String name = 'DeleteAccountRoute';
}

class ChangeUsernameRoute extends _i1.PageRouteInfo<ChangeUsernameRouteArgs> {
  ChangeUsernameRoute({_i20.Key? key})
      : super(name,
            path: '/change-username-page',
            args: ChangeUsernameRouteArgs(key: key));

  static const String name = 'ChangeUsernameRoute';
}

class ChangeUsernameRouteArgs {
  const ChangeUsernameRouteArgs({this.key});

  final _i20.Key? key;
}

class ChangePasswordRoute extends _i1.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({_i20.Key? key})
      : super(name,
            path: '/change-password-page',
            args: ChangePasswordRouteArgs(key: key));

  static const String name = 'ChangePasswordRoute';
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({this.key});

  final _i20.Key? key;
}

class AddBusinessRoute extends _i1.PageRouteInfo {
  const AddBusinessRoute() : super(name, path: '/add-business-page');

  static const String name = 'AddBusinessRoute';
}

class EditBusinessRoute extends _i1.PageRouteInfo {
  const EditBusinessRoute() : super(name, path: '/edit-business-page');

  static const String name = 'EditBusinessRoute';
}

class AddOrganizationRoute extends _i1.PageRouteInfo<AddOrganizationRouteArgs> {
  AddOrganizationRoute({_i20.Key? key})
      : super(name,
            path: '/add-organization-page',
            args: AddOrganizationRouteArgs(key: key));

  static const String name = 'AddOrganizationRoute';
}

class AddOrganizationRouteArgs {
  const AddOrganizationRouteArgs({this.key});

  final _i20.Key? key;
}

class ListOrganizationRoute
    extends _i1.PageRouteInfo<ListOrganizationRouteArgs> {
  ListOrganizationRoute({_i20.Key? key})
      : super(name,
            path: '/list-organization-page',
            args: ListOrganizationRouteArgs(key: key));

  static const String name = 'ListOrganizationRoute';
}

class ListOrganizationRouteArgs {
  const ListOrganizationRouteArgs({this.key});

  final _i20.Key? key;
}

class BusinessOwnerViewRoute extends _i1.PageRouteInfo {
  const BusinessOwnerViewRoute()
      : super(name, path: '/business-owner-view-page');

  static const String name = 'BusinessOwnerViewRoute';
}
