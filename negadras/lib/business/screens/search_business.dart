import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/business/screens/widgets/business_card.dart';
import 'package:negadras/business/screens/widgets/label.dart';
import 'package:negadras/business/screens/widgets/search_bar.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';

class SearchBusinessPage extends StatelessWidget {
  const SearchBusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: bottomNav(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Label(
                label: "Kaldi's Coffee near you",
                fontStyle: FontStyle.italic,
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 0,
            //     itemBuilder: (context, i) {
            //       return BusinessCard(
            //         businessId: 'Kaldi\'s id',
            //         businessName: 'Kaldi\'s Coffee',
            //         rating: 2.5,
            //         locationInfo: '103 Bole Street, Cameroon Ave',
            //         imagePath: 'assets/images/hacker.jpeg',
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
