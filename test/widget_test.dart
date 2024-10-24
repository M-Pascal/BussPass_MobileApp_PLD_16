// Import necessary packages for testing
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buss_pass/main.dart'; // Import your main.dart file

void main() {
  // Define a test group
  testWidgets('Busspass App has a title, avatar, and list items',
      (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(BusspassApp());

    // Verify that the title 'Busspass' is in the AppBar
    expect(find.text('Busspass'), findsOneWidget);

    // Verify that an avatar exists
    expect(find.byType(CircleAvatar), findsOneWidget);

    // Verify that the list items (Home, Explore, Tickets, Profile) are present
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('Tickets'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);

    // Verify that the Logout button exists
    expect(find.text('Logout'), findsOneWidget);
    expect(find.byIcon(Icons.logout), findsOneWidget);
  });
}
