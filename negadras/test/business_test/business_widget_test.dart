import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:negadras/business/screens/favorites_page.dart';
import 'package:negadras/business/screens/filter_business.dart';
import 'package:negadras/business/screens/widgets/business_card.dart';
import 'package:negadras/business/screens/widgets/search_bar.dart';

void main() {
  testWidgets('Filter Business Page Shows Up', (WidgetTester tester) async {
    await tester.pumpWidget(FilterBusinessPage());

    final titleFinder = find.text("Filter");
    final searchBarFinder = find.byWidget(SearchBar());
    final businessCardFinder = find.byWidget(BusinessCard(
        businessId: "businessId",
        businessName: "businessName",
        rating: 0,
        locationInfo: "locationInfo",
        imagePath: "imagePath"));
    final listViewFinder = find.byWidget(ListView());
    final progressIndicatorFinder = find.byWidget(CircularProgressIndicator());

    expect(titleFinder, findsOneWidget);
    expect(searchBarFinder, findsOneWidget);
    expect(businessCardFinder, findsOneWidget);
    expect(listViewFinder, findsOneWidget);
    expect(progressIndicatorFinder, findsOneWidget);
  });

  testWidgets('Favorites Page Shows Up', (WidgetTester tester) async {
    await tester.pumpWidget(FavoritesPage());

    final titleFinder = find.text("Favorites");
    final businessCardFinder = find.byWidget(BusinessCard(
        businessId: "businessId",
        businessName: "businessName",
        rating: 0,
        locationInfo: "locationInfo",
        imagePath: "imagePath"));
    final listViewFinder = find.byWidget(ListView());
    final progressIndicatorFinder = find.byWidget(CircularProgressIndicator());
    final buttonFinder = find.byWidget(GestureDetector());

    expect(titleFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
    expect(businessCardFinder, findsOneWidget);
    expect(listViewFinder, findsOneWidget);
    expect(progressIndicatorFinder, findsOneWidget);
  });
  testWidgets('Add Business Screen Shows up', (WidgetTester tester) async {
    await tester.pumpWidget(FavoritesPage());

    final optionTextFinder = find.text("Please Choose");
    final textFormFieldFinder = find.byWidget(TextFormField());
    final websiteTextFinder = find.text('Website');
    final phoneNumberFinder = find.text("Phone Number");
    final emailFinder = find.text("Email");
    final locationFinder = find.text('Location');
    final addBusinessTextFinder = find.text("Add New Business");
    final createBusinessButtonFinder =
        find.byWidget(ElevatedButton(onPressed: () {}, child: Text("")));

    expect(optionTextFinder, findsOneWidget);
    expect(textFormFieldFinder, findsOneWidget);
    expect(websiteTextFinder, findsOneWidget);
    expect(phoneNumberFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
    expect(locationFinder, findsOneWidget);
    expect(addBusinessTextFinder, findsOneWidget);
    expect(createBusinessButtonFinder, findsOneWidget);
  });
}
