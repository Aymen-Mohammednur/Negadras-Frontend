import 'package:flutter/material.dart';
import 'package:negadras/buisness/screens/widgets/business_card.dart';
import 'package:negadras/buisness/screens/widgets/label.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';

class MyBusinessPage extends StatelessWidget {
  const MyBusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Label(
                label: "My Businesses",
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
