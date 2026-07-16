import 'package:devfolio/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App launches on the home page with all nav tabs', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Projects'), findsOneWidget);
    expect(find.text('Resume'), findsOneWidget);
    expect(find.text('Contact'), findsOneWidget);
  });
}
