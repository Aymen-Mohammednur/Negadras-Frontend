import 'package:flutter/material.dart';
import 'package:negadras/buisness/screens/widgets/business_card.dart';
import 'package:negadras/buisness/screens/widgets/label.dart';
import 'package:negadras/buisness/screens/widgets/search_bar.dart';

class SearchBusiness extends StatelessWidget {
  const SearchBusiness({Key? key}) : super(key: key);

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
              child: Label(
                label: "Kaldi's Coffee near you",
                fontStyle: FontStyle.italic,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return BusinessCard(
                    businessName: 'Kaldi\'s Coffee',
                    rating: 2.5,
                    locationInfo: '103 Bole Street, Cameroon Ave',
                    imagePath: 'assets/images/hacker.jpeg',
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
