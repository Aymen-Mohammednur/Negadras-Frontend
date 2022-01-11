import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:negadras/review/screens/user_view.dart';
import 'package:negadras/review/screens/widgets.dart';

void main() {
  testWidgets('User View Page Shows Up', (WidgetTester tester) async {
    await tester.pumpWidget(UserViewPage("", "", "", ""));

    final titleFinder = find.byType(Text);
    final listViewFinder = find.byWidget(ListView());
    final iconBuilderFinder = find.byType(IconTextPair);
    final actionButtonFinder = find.byType(FloatingActionButton);

    expect(titleFinder, findsOneWidget);
    expect(listViewFinder, findsOneWidget);
    expect(iconBuilderFinder, findsOneWidget);
    expect(actionButtonFinder, findsOneWidget);
  });
}
