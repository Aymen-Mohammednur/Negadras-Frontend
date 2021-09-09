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

class FilterBusinessPage extends StatelessWidget {
  final String? categoryId;
  final String? queryParameter;
  const FilterBusinessPage({Key? key, this.categoryId, this.queryParameter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final businessBloc = BlocProvider.of<BusinessBloc>(context);
    return Scaffold(
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
                  label: "Restaurants near you",
                  fontStyle: FontStyle.italic,
                ),
              ),
              BlocBuilder<BusinessBloc, BusinessState>(
                builder: (context, businessState) {
                  print(businessState);
                  if (businessState is BusinessInitialState) {
                    businessBloc.add(FilterBusinessEvent(categoryId));
                  } else if (businessState is BusinessView) {
                    context.pushRoute(
                        UserViewRoute(businessId: businessState.businessId));
                  } else if (businessState is StaticFetchState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              businessBloc.add(
                                  LoadBusinessEvent(businessId: "businessId"));
                            },
                            child: BusinessCard(
                              businessName: 'Kaldi\'s Coffee',
                              rating: 2.5,
                              locationInfo: '103 Bole Street, Cameroon Ave',
                              imagePath: 'assets/images/macbook.jpg',
                            ),
                          );
                        },
                      ),
                    );
                  }
                  if (businessState is BusinessFetchResultState) {
                    ListView.builder(
                      itemCount: businessState.businessList.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            businessBloc.add(LoadBusinessEvent(
                                businessId: businessState.businessList[i].id));
                          },
                          child: BusinessCard(
                            businessName: businessState.businessList[i].name,
                            rating:
                                4, //Get the review repo and pass the business id
                            locationInfo:
                                businessState.businessList[i].location,
                            imagePath: 'assets/images/macbook.jpg',
                          ),
                        );
                      },
                    );
                  }
                  if (businessState is BusinessOperationFailure) {
                    return Center(
                      child: Text(businessState.errMsg.toString()),
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
