// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// Not sure how to intialise the firebase -> which is causing errors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questionnaire_controller.dart';
import 'package:wellbeing_junction/elements/answer_tile.dart';
import 'package:wellbeing_junction/elements/quiz_tile.dart';
import 'package:wellbeing_junction/screens/dashboard_screen.dart';
import 'package:wellbeing_junction/screens/forgot_password_screen.dart';
import 'package:wellbeing_junction/screens/insight.dart';
import 'package:wellbeing_junction/screens/login_screen.dart';
import 'package:wellbeing_junction/screens/self_assessment_quiz.dart';
import 'package:wellbeing_junction/screens/signup_screen.dart';

void main() {
  testWidgets('UI elements test for LoginPage', (WidgetTester tester) async {
    final LoginPage loginPage = LoginPage(onTap: () {});
    await tester.pumpWidget(MaterialApp(home: loginPage));

    expect(find.byType(Image), findsNWidgets(2));
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Log in'), findsOneWidget);
  });

  testWidgets('UI elements test for SignUpPage', (WidgetTester tester) async {
    final SignUpPage signUpPage = SignUpPage(onTap: () {});
    await tester.pumpWidget(MaterialApp(home: signUpPage));

    expect(find.byType(Image), findsNWidgets(2));
    expect(find.byType(TextField), findsNWidgets(4));
    expect(find.text('Sign Up'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), 'John Doe');
    await tester.enterText(find.byType(TextField).at(1), 'johndoe@example.com');
    await tester.enterText(find.byType(TextField).at(2), 'password');
    await tester.enterText(find.byType(TextField).at(3), 'password');
    await tester.tap(find.text('Sign Up'));
  });

  testWidgets('Test for forget password in LoginPage',
      (WidgetTester tester) async {
    final LoginPage loginPage = LoginPage(onTap: () {});
    await tester.pumpWidget(MaterialApp(home: loginPage));
    await tester.tap(find.text('Forgot Password?'));
    await tester.pumpAndSettle(); // Wait for navigation
    expect(find.byType(ForgetPassword), findsOneWidget);
    await tester.pump(); // Refresh the widget tree
  });

  testWidgets('UI elements test for Dashboard', (WidgetTester tester) async {
    final Dashboard dashboard = Dashboard();
    await tester.pumpWidget(MaterialApp(home: dashboard));

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.byType(IndexedStack), findsOneWidget);

    await tester.tap(find.byIcon(Icons.build)); // Simulate changing tabs
  });
}
