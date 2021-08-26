import 'package:flutter/material.dart';
import 'package:negadras/buisness/screens/widgets/business_card.dart';

class MyBusiness extends StatelessWidget {
  const MyBusiness({Key? key}) : super(key: key);

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
                "My Organizations",
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
