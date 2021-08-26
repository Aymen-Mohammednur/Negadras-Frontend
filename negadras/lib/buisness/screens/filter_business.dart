import 'package:flutter/material.dart';
import 'package:negadras/buisness/screens/widgets/business_card.dart';
import 'package:negadras/buisness/screens/widgets/search_bar.dart';

class FilterBusiness extends StatelessWidget {
  const FilterBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBar(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: const Text(
                "Restaurants near you",
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return BusinessCard(
                    businessName: 'Kaldi\'s Coffee',
                    locationInfo: 'Bole',
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
