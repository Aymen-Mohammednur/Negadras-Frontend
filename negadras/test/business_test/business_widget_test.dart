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
    final searchBarFinder = find.text("Search");

    expect(titleFinder, findsOneWidget);
    expect(searchBarFinder, findsOneWidget);
  });

  testWidgets('Favorites Page Shows Up', (WidgetTester tester) async {
    await tester.pumpWidget(FavoritesPage());

    final titleFinder = find.text("Favorites");

    expect(titleFinder, findsOneWidget);
  });
  testWidgets('Add Business Screen Shows up', (WidgetTester tester) async {
    await tester.pumpWidget(FavoritesPage());

    final optionTextFinder = find.text("Please Choose");
    final websiteTextFinder = find.text('Website');
    final phoneNumberFinder = find.text("Phone Number");
    final emailFinder = find.text("Email");
    final locationFinder = find.text('Location');
    final addBusinessTextFinder = find.text("Add New Business");

    expect(optionTextFinder, findsOneWidget);
    expect(websiteTextFinder, findsOneWidget);
    expect(phoneNumberFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
    expect(locationFinder, findsOneWidget);
    expect(addBusinessTextFinder, findsOneWidget);
  });
}
