import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:negadras/organization/screens/add_organization.dart';
import 'package:negadras/organization/screens/list_organization_page.dart';

void main() {
  testWidgets('Organization List Page Shows Up', (WidgetTester tester) async {
    await tester.pumpWidget(ListOrganizationPage());

    final textWidgetFinder = find.byType(Text);
    final tapListenerFinder = find.byWidget(GestureDetector());
    final modifyIconFinder = find.widgetWithIcon(GestureDetector, Icons.edit);
    final deleteIconFinder = find.widgetWithIcon(GestureDetector, Icons.delete);
    final addIconFinder = find.widgetWithIcon(GestureDetector, Icons.add);
    final addToolTipFinder = find.byTooltip("Increment");
    final listViewFinder = find.byWidget(ListView());
    final progressIndicatorFinder = find.byWidget(CircularProgressIndicator());

    expect(textWidgetFinder, findsOneWidget);
    expect(tapListenerFinder, findsNWidgets);
    expect(modifyIconFinder, findsOneWidget);
    expect(deleteIconFinder, findsOneWidget);
    expect(addIconFinder, findsOneWidget);
    expect(addToolTipFinder, findsOneWidget);
    expect(listViewFinder, findsNWidgets);
    expect(progressIndicatorFinder, findsOneWidget);
  });

  testWidgets('Add Organization Page Shows Up', (WidgetTester tester) async {
    await tester.pumpWidget(AddOrganizationPage());

    final formFinder = find.text("Add Organization");
    final iconFinder =
        find.widgetWithIcon(GestureDetector, Icons.account_balance);
    final listViewFinder = find.byWidget(ListView());
    final progressIndicatorFinder = find.byWidget(CircularProgressIndicator());
    final textFormFieldFinder = find.byType(TextFormField);

    expect(formFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
    expect(textFormFieldFinder, findsOneWidget);
    expect(listViewFinder, findsOneWidget);
    expect(progressIndicatorFinder, findsOneWidget);
  });
}
