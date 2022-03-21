import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todos/main.dart';

void main() {
  testWidgets('플로팅 버튼을 누르면 텍스트를 입력할 수 있어요.', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.byType(TextField), findsNothing);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.byType(TextField), findsOneWidget);
  });
}
