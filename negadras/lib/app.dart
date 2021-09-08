import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/auth/blocs/auth_bloc.dart';
import 'package:negadras/auth/blocs/auth_event.dart';
import 'package:negadras/auth/blocs/auth_state.dart';
import 'package:negadras/auth/data_providers/auth-data-provider.dart';
import 'package:negadras/auth/repository/auth-repository.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:negadras/category/blocs/category_bloc.dart';
import 'package:negadras/routes/router.gr.dart';

import 'package:negadras/category/repository/category_repository.dart';
import 'package:negadras/category/data_providers/category_data_provider.dart';
import 'package:negadras/business/repository/buisness_repository.dart';
import 'package:negadras/business/data_providers/buisness_data_provider.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final categoryRepository = CategoryRepository(CategoryDataProvider());
    final businessRepository = BusinessRepository(BusinessDataProvider());
    final authRepository = AuthRepository(AuthDataProvider());

    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (_) => CategoryBloc(
              categoryRepository: categoryRepository,
              businessRepository: businessRepository)..add(CategoryFetch()),
        ),
        BlocProvider<BusinessBloc>(
          create: (_) => BusinessBloc(
            businessRepository: businessRepository,
          ),
        ),
        BlocProvider(
          create: (context) => LoginBloc(authRepository: authRepository)..add(LoginNormal()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(authRepository: authRepository)..add(RegisterNormal()),
        )
      ],
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
