import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:negadras/auth/data_providers/auth-data-provider.dart';
import 'package:negadras/auth/login/bloc/login_bloc.dart';
import 'package:negadras/auth/repository/auth_repository.dart';
import 'package:negadras/auth/signup/bloc/sign_up_bloc.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:negadras/category/blocs/category_bloc.dart';
import 'package:negadras/organization/bloc/organization_bloc.dart';
import 'package:negadras/organization/data_providers/organization_data_provider.dart';
import 'package:negadras/organization/repository/organization_repository.dart';
import 'package:negadras/review/blocs/blocs.dart';
import 'package:negadras/review/repository/review_repository.dart';
import 'package:negadras/routes/router.gr.dart';

import 'package:negadras/category/repository/category_repository.dart';
import 'package:negadras/category/data_providers/category_data_provider.dart';
import 'package:negadras/business/repository/buisness_repository.dart';
import 'package:negadras/business/data_providers/buisness_data_provider.dart';

import 'review/data_providers/data_providers.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final categoryRepository = CategoryRepository(CategoryDataProvider());
    final businessRepository = BusinessRepository(BusinessDataProvider());
    final authRepository = AuthRepository(AuthDataProvider(http.Client()));
    final reviewRepository = ReviewRepository(ReviewDataProvider());
    final organizationRepository =
        OrganizationRepository(OrganizationDataProvider());

    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (_) => CategoryBloc(
            categoryRepository: categoryRepository,
          )..add(CategoryFetch()),
        ),
        BlocProvider<BusinessBloc>(
            create: (_) => BusinessBloc(
                  businessRepository: businessRepository,
                )),
        BlocProvider(
            create: (context) => OrganizationBloc(
                organizationRepository: organizationRepository)..add(OrganizationLoad())),
        BlocProvider(create: (context) => LoginBloc(authRepo: authRepository)),
        BlocProvider(create: (context) => SignUpBloc(authRepo: authRepository)),
        BlocProvider<ReviewBloc>(
            create: (context) => ReviewBloc(reviewRepository)),
        BlocProvider<UserReviewBloc>(
            create: (context) => UserReviewBloc(reviewRepository)),
        // BlocProvider<OrganizationBloc>(create: (context) => OrganizationBloc(organizationRepository: organizationRepository));
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green.shade900,
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
