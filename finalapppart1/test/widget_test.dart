// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:finalapppart1/main.dart'; // Ensure correct import

void main() {
  testWidgets('Login page test', (WidgetTester tester) async {
    // Build the LoginPage and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: MyApp()));

    // Verify that the Username and Password fields are present.
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Verify the presence of the Log In button.
    expect(find.widgetWithText(ElevatedButton, 'Log In'), findsOneWidget);
  });
}

