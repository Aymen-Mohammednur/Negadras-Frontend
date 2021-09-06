import 'package:auto_route/annotations.dart';
import 'package:negadras/business/screens/add_business.dart';
import 'package:negadras/business/screens/edit_business.dart';
import 'package:negadras/business/screens/favorites.dart';
import 'package:negadras/business/screens/filter_business.dart';
import 'package:negadras/business/screens/my_business.dart';
import 'package:negadras/business/screens/search_business.dart';
import 'package:negadras/category/screens/home_page.dart';
import 'package:negadras/review/screens/user_view.dart';
import 'package:negadras/user/screens/account_management.dart';
import 'package:negadras/user/screens/changepassword.dart';
import 'package:negadras/user/screens/changeusername.dart';
import 'package:negadras/user/screens/deleteaccount.dart';
import 'package:negadras/user/screens/me_tab.dart';
import 'package:negadras/user/screens/signin.dart';
import 'package:negadras/user/screens/signup.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage),
    AutoRoute(page: FilterBusinessPage),
    AutoRoute(page: SearchBusinessPage),
    AutoRoute(page: FavoritesPage),
    AutoRoute(page: MePage),
    AutoRoute(page: AccountManagementPage),
    AutoRoute(page: MyBusinessPage),
    AutoRoute(page: UserViewPage),
    AutoRoute(page: SignUpPage, initial: true),
    AutoRoute(page: SignInPage),
    AutoRoute(page: DeleteAccountPage),
    AutoRoute(page: ChangeUsernamePage),
    AutoRoute(page: ChangePasswordPage),
    AutoRoute(page: AddBusinessPage),
    AutoRoute(page: EditBusinessPage),
  ],
)
class $AppRouter {}
