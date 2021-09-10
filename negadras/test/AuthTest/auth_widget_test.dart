import 'package:flutter_test/flutter_test.dart';
import 'package:negadras/auth/login/login_view.dart';
import 'package:negadras/auth/signup/sign_up_view.dart';

void main() {
  testWidgets('Sign Up Screen Shows up', (WidgetTester tester) async {
    await tester.pumpWidget(SignUpPage());

    final titleFinder = find.text('Create Account');
    final firstNameFinder = find.text('First name');
    final lastNameFinder = find.text('Last name');
    final usernameFinder = find.text('Username');
    // final emailFinder = find.text('Email');
    final passwordFinder = find.text('Password');
    final cpasswordFinder = find.text('Confirm Password');
    final singupFinder = find.text("Sign Up");
    final singupMessageFinder = find.text("Already have an account? Sign in.");

    expect(titleFinder, findsOneWidget);
    expect(firstNameFinder, findsOneWidget);
    expect(lastNameFinder, findsOneWidget);
    expect(usernameFinder, findsOneWidget);
    // expect(emailFinder, findsOneWidget);
    expect(passwordFinder, findsOneWidget);
    expect(cpasswordFinder, findsOneWidget);
    expect(singupFinder, findsOneWidget);
    expect(singupMessageFinder, findsOneWidget);
  });

  testWidgets('Sign In Screen Shows up', (WidgetTester tester) async {
    await tester.pumpWidget(LoginPage());

    final titleFinder = find.text('Sign In to Negadras');
    final usernameFinder = find.text('Username');
    final passwordFinder = find.text('Password');
    final singinFinder = find.text("Login");
    final singupMessageFinder = find.text("Don\'t have an account? Sign Up.");

    expect(titleFinder, findsOneWidget);
    expect(usernameFinder, findsOneWidget);
    expect(passwordFinder, findsOneWidget);
    expect(singinFinder, findsOneWidget);
    expect(singupMessageFinder, findsOneWidget);
  });
}
