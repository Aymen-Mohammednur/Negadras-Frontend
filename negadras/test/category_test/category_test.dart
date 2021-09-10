import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:negadras/business/screens/favorites_page.dart';
import 'package:negadras/business/screens/filter_business.dart';
import 'package:negadras/business/screens/widgets/business_card.dart';
import 'package:negadras/business/screens/widgets/search_bar.dart';

void main() {
  testWidgets('Home Page Shows Up', (WidgetTester tester) async {
    await tester.pumpWidget(FilterBusinessPage());

    final buttonFinder = find.byWidget(GestureDetector());
    final titleFinder = find.text("Negadras");
    final errorTextFinder = find.text("Could not do category operation");
    final optionTextFinder = find.text("What are you looking for...");
    final progressIndicatorFinder = find.byWidget(CircularProgressIndicator());
    final actionButtonFinder = find.byType(FloatingActionButton);
    final actionToolTipFinder = find.byTooltip("Increment");

    expect(titleFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
    expect(errorTextFinder, findsOneWidget);
    expect(optionTextFinder, findsOneWidget);
    expect(progressIndicatorFinder, findsOneWidget);
    expect(actionButtonFinder, findsOneWidget);
    expect(actionToolTipFinder, findsOneWidget);
  });
}
