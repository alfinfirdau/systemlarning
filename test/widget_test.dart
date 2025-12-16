import 'package:flutter_test/flutter_test.dart';
import 'package:sistemlearning/main.dart';

void main() {
  testWidgets('App starts and shows Login Info Screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the login info screen content is present.
    // "Access restricted" is part of the text on the first screen.
    expect(find.textContaining('Access restricted'), findsOneWidget);
  });
}
