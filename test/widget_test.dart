import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets(
    'One Cloud Enterprise Platform loads',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const OneCloudApp(),
      );

      expect(
        find.text('One Cloud Enterprise Platform'),
        findsOneWidget,
      );
    },
  );
}