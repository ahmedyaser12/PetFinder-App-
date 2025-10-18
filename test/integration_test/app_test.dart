import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:petfinder_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App loads and displays cats', (tester) async {
    // Start app
    app.main();
    await tester.pumpAndSettle();

    // Example: Verify loading indicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for API result
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Example: Verify list or text is visible
    expect(find.text('Bengal'), findsOneWidget);
  });
}
