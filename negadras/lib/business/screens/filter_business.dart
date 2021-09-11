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

class FilterBusinessPage extends StatefulWidget {
  String? categoryId;
  final String? queryParameter;
  FilterBusinessPage({Key? key, this.categoryId, this.queryParameter})
      : super(key: key);

  @override
  _FilterBusinessPageState createState() => _FilterBusinessPageState();
}

class _FilterBusinessPageState extends State<FilterBusinessPage> {
  @override
  void initState() {
    print("In init state");
    Future.delayed(Duration.zero).then((value) {
      BusinessBloc businessBloc = BlocProvider.of<BusinessBloc>(context);
      businessBloc.add(NormalBusinessEvent());
    });
    print("before super.init");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final businessBloc = BlocProvider.of<BusinessBloc>(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(20, 40, 65, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(20, 40, 65, 1),
          title: Text(
            "Filter",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
                color: Colors.amberAccent),
          ),
        ),
        // bottomNavigationBar: bottomNav(context, 0),
        bottomNavigationBar: ownerBottomNav(context, 0) as Widget,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(categoryId: widget.categoryId),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                // child: Label(
                //   label: "${widget.categoryId} near you",
                //   fontStyle: FontStyle.italic,
                // ),

                child: Text(
                  "${widget.categoryId} near you",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.amberAccent),
                ),
              ),
              BlocBuilder<BusinessBloc, BusinessState>(
                builder: (context, businessState) {
                  print("Filter class: $businessState");
                  // print(" ");
                  print(widget.categoryId);

                  if (businessState is BusinessInitialState) {
                    businessBloc.add(FilterBusinessEvent(widget.categoryId));
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
                    print(widget.categoryId);
                    if (businessState.categoryId != widget.categoryId) {
                      businessState.categoryId = widget.categoryId as String;
                      businessBloc
                          .add(FilterBusinessEvent(businessState.categoryId));
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: businessState.businessList.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              // businessBloc.add(LoadBusinessEvent(
                              //     businessId:
                              //         businessState.businessList[i].id));
                              context.router.push(UserViewRoute(
                                  businessId:
                                      businessState.businessList[i].id));
                            },
                            child: BusinessCard(
                              isOwner:
                                  businessState.businessList[i].isOwner as bool,
                              from: (_isFavorite) {
                                if (!_isFavorite) {
                                  businessBloc.add(AddToFavoritesEvent(
                                      businessState.businessList[i].id));
                                } else {
                                  businessBloc.add(RemoveFromFavoritesEvent(
                                      businessState.businessList[i].id));
                                }
                                // businessBloc.add(RemoveFromFavoritesEvent(
                                //     businessState.businessList[i].id));
                                // context.router.popAndPush(FilterBusinessRoute(categoryId: businessState.businessList[i].categoryId));
                              },
                              businessId: businessState.businessList[i].id,
                              businessName: businessState.businessList[i].name,
                              rating:
                                  2.5, //businessState.businessList[i].avgRating,
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
                    if (businessState.categoryId != widget.categoryId) {
                      businessState.categoryId = widget.categoryId as String;
                      businessBloc
                          .add(FilterBusinessEvent(businessState.categoryId));
                    }
                    return Expanded(
                      child: Center(
                        // child: Text(businessState.errMsg.toString()),
                        child: Text(
                          "Failed to Fetch Businesses",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.amberAccent),
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.amberAccent,
                    )),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
