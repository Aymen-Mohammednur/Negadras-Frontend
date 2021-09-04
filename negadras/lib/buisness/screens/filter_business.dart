import 'package:flutter/material.dart';
import 'package:negadras/buisness/screens/widgets/business_card.dart';
import 'package:negadras/buisness/screens/widgets/label.dart';
import 'package:negadras/buisness/screens/widgets/search_bar.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';

class FilterBusinessPage extends StatelessWidget {
  const FilterBusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBar(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Label(label: "Restaurants near you", fontStyle: FontStyle.italic,),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return BusinessCard(
                    businessName: 'Kaldi\'s Coffee',
                    rating: 2.5,
                    locationInfo: '103 Bole Street, Cameroon Ave',
                    imagePath: 'assets/images/macbook.jpg',
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
