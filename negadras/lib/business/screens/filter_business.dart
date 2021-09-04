import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:negadras/business/screens/widgets/business_card.dart';
import 'package:negadras/business/screens/widgets/label.dart';
import 'package:negadras/business/screens/widgets/search_bar.dart';

class FilterBusinessPage extends StatelessWidget {
  const FilterBusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final businessBloc = BlocProvider.of<BusinessBloc>(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Label(
              label: "Restaurants near you",
              fontStyle: FontStyle.italic,
            ),
          ),
          BlocBuilder<BusinessBloc, BusinessState>(
            builder: (context, businessState) {
              if (businessState is BusinessInitial) {
                businessBloc.add(LoadBusiness(businessId: "businessId"));
              }
              if (businessState is BusinessLoading) {
                return Expanded(
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  )),
                );
              }
              if (businessState is BusinessLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          businessBloc
                              .add(LoadBusiness(businessId: "businessId"));
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
              } else {
                return Center(
                  child: const Text("Testing"),
                );
              }
            },
          ),
        ],
      ),
    ));
  }
}
