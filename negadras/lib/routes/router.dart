import 'package:auto_route/annotations.dart';
import 'package:negadras/buisness/screens/favorites.dart';
import 'package:negadras/buisness/screens/filter_business.dart';
import 'package:negadras/buisness/screens/my_business.dart';
import 'package:negadras/category/screens/home_page.dart';
import 'package:negadras/user/screens/account_management.dart';
import 'package:negadras/user/screens/me_tab.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[
      AutoRoute(page: HomePage,initial: true),
      AutoRoute(page: FilterBusinessPage),
      AutoRoute(page: SearchBusinessPage),
      AutoRoute(page: FavoritesPage),
      AutoRoute(page: MePage),
      AutoRoute(page: AccManagePage),
      AutoRoute(page: MyBusinessPage),
    ],
)
class $AppRouter {}