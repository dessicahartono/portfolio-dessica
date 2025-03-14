import 'package:flutter/material.dart';
import 'package:flutter_portfolio_dessica/app.dart';
import 'package:flutter_test/flutter_test.dart';

//build an app (must trigger a frame) and verify that the title is displayed
void main() {
  testWidgets('HomePage has a title and opens drawer',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('PORTFOLIO'), findsOneWidget);

    //open the app_drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    //item menu at the drawer must be present
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    expect(find.text('Contact'), findsOneWidget);

    //close the app_drawer
    await tester.tap(find.byTooltip(
        'Close navigation menu')); // This assumes you have a close button in the drawer
    await tester.pumpAndSettle(); // Wait for the drawer to close
  });
}
