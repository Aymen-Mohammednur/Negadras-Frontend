import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:negadras/business/screens/widgets/business_card.dart';
import 'package:negadras/business/screens/widgets/label.dart';
import 'package:negadras/business/screens/widgets/search_bar.dart';
import 'package:negadras/review/repository/review_repository.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:negadras/user/screens/me_tab.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';
import 'package:auto_route/auto_route.dart';

import 'package:negadras/auth/data_providers/auth-data-provider.dart';
import 'package:negadras/auth/repository/auth_repository.dart';

class FilterBusinessPage extends StatelessWidget {
  String? categoryId;
  final String? queryParameter;
  FilterBusinessPage({Key? key, this.categoryId, this.queryParameter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final businessBloc = BlocProvider.of<BusinessBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Filter"),
        ),
        bottomNavigationBar: bottomNav(context),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBar(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Label(
                  label: "$categoryId near you",
                  fontStyle: FontStyle.italic,
                ),
              ),
              BlocBuilder<BusinessBloc, BusinessState>(
                builder: (context, businessState) {
                  print("Filter class: $businessState");
                  // print(" ");
                  print(categoryId);

                  if (businessState is BusinessInitialState) {
                    businessBloc.add(FilterBusinessEvent(categoryId));
                  }
                  //else if (businessState is BusinessView) {
                  //   context.pushRoute(
                  //       UserViewRoute(businessId: businessState.businessId));
                  // }
                  //else if (businessState is StaticFetchState) {
                  //   return Expanded(
                  //     child: ListView.builder(
                  //       itemCount: 10,
                  //       itemBuilder: (context, i) {
                  //         return GestureDetector(
                  //           onTap: () {
                  //             businessBloc.add(
                  //                 LoadBusinessEvent(businessId: "businessId"));
                  //           },
                  //           child: BusinessCard(
                  //             businessName: 'Kaldi\'s Coffee',
                  //             rating: 2.5,
                  //             locationInfo: '103 Bole Street, Cameroon Ave',
                  //             imagePath: 'assets/images/macbook.jpg',
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   );
                  // }
                  if (businessState is BusinessFetchResultState) {
                    // print(businessState.businessList[0].name);
                    print(categoryId);
                    if (businessState.categoryId != categoryId) {
                      businessState.categoryId = categoryId as String;
                      businessBloc
                          .add(FilterBusinessEvent(businessState.categoryId));
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: businessState.businessList.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              businessBloc.add(LoadBusinessEvent(
                                  businessId:
                                      businessState.businessList[i].id));
                            },
                            child: BusinessCard(
                              businessId: businessState.businessList[i].id,
                              businessName: businessState.businessList[i].name,
                              rating: businessState.businessList[i].avgRating,
                              locationInfo:
                                  businessState.businessList[i].location,
                              imagePath: 'assets/images/macbook.jpg',
                              isFavorite: businessState
                                  .businessList[i].isFavorite as bool,
                            ),
                          );
                        },
                      ),
                    );
                  }
                  if (businessState is Failure) {
                    if (businessState.categoryId != categoryId) {
                      businessState.categoryId = categoryId as String;
                      businessBloc
                          .add(FilterBusinessEvent(businessState.categoryId));
                    }
                    return Center(
                      // child: Text(businessState.errMsg.toString()),
                      child: Text("Failed to Fetch Businesses"),
                    );
                  }
                  return Expanded(
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
