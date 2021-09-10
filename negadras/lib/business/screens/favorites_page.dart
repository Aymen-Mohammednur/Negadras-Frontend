import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:negadras/business/screens/widgets/business_card.dart';
import 'package:negadras/business/screens/widgets/label.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final businessBloc = BlocProvider.of<BusinessBloc>(context);
    return Scaffold(
      // bottomNavigationBar: bottomNav(context, 1),
      bottomNavigationBar: ownerBottomNav(context, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Label(
                label: "Favorites",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Expanded(
              child: BlocBuilder<BusinessBloc, BusinessState>(
                builder: (context, businessState) {
                  if (businessState is BusinessInitialState) {
                    businessBloc.add(ShowFavoritesEvent());
                  }

                  if (businessState is BusinessFetchResultState) {
                    return ListView.builder(
                      itemCount: businessState.businessList.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            businessBloc.add(LoadBusinessEvent(
                                businessId: businessState.businessList[i].id));
                          },
                          child: BusinessCard(
                            businessId: businessState.businessList[i].id,
                            businessName: businessState.businessList[i].name,
                            rating:
                                2.5, //Get the review repo and pass the business id
                            locationInfo:
                                businessState.businessList[i].location,
                            imagePath: 'assets/images/macbook.jpg',
                            isFavorite: businessState.businessList[i].isFavorite
                                as bool,
                          ),
                        );
                      },
                    );
                  }

                  if (businessState is BusinessOperationFailure) {
                    return Center(
                      child: Text("Failed to retrieve Favorites"),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
