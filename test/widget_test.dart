
import 'package:flutter_test/flutter_test.dart';
import 'package:tebac_app/main.dart';
import 'package:tebac_app/screens/splash_screen.dart';

void main() {
  testWidgets('SplashScreen loads', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(MyApp());

    // Verify that SplashScreen is present
    expect(find.byType(SplashScreen), findsOneWidget);

    // Optionally, check that your app title text exists
    expect(find.text('My Awesome App'), findsOneWidget);
  });
}

