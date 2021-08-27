import 'package:flutter/material.dart';
import 'package:negadras/buisness/screens/widgets/business_card.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: const Text(
                "Favorites",
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return BusinessCard(
                    businessName: 'Kaldi\'s Coffee',
                    rating: 2,
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
