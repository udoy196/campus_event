import 'package:flutter_test/flutter_test.dart';
import 'package:campus_event/main.dart';

void main() {
  testWidgets('Campus Event App Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byType(MyApp), findsOneWidget);
  });
}
