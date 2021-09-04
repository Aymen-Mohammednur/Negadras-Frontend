import 'package:auto_route/annotations.dart';
import 'package:negadras/app.dart';
import 'package:negadras/business/screens/favorites.dart';
import 'package:negadras/business/screens/filter_business.dart';
import 'package:negadras/business/screens/my_business.dart';
import 'package:negadras/business/screens/search_business.dart';
// import 'package:negadras/category/screens/home_page.dart';
import 'package:negadras/user/screens/account_management.dart';
import 'package:negadras/user/screens/me_tab.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: App, initial: true),
    AutoRoute(page: FilterBusinessPage),
    AutoRoute(page: SearchBusinessPage),
    AutoRoute(page: FavoritesPage),
    AutoRoute(page: MePage),
    AutoRoute(page: AccountManagementPage),
    AutoRoute(page: MyBusinessPage),
  ],
)
class $AppRouter {}
