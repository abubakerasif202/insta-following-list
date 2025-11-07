import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:insta_following_list/home_page.dart';

Color? _resolveColor(MaterialStateProperty<Color?>? property) {
  return property?.resolve(<MaterialState>{});
}

void main() {
  testWidgets('follow button toggles text and color when tapped', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    await tester.pumpAndSettle();

    const String sampleUserName = 'Jane Cooper';
    expect(find.text(sampleUserName), findsOneWidget);

    final Finder buttonFinder = find.byKey(const ValueKey<String>('follow-button-0'));
    expect(buttonFinder, findsOneWidget);

    TextButton button = tester.widget<TextButton>(buttonFinder);
    Text label = button.child! as Text;
    expect(label.data, equals('Follow'));

    final Color? initialBackground = _resolveColor(button.style?.backgroundColor);
    final Color? initialForeground = _resolveColor(button.style?.foregroundColor);

    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    button = tester.widget<TextButton>(buttonFinder);
    label = button.child! as Text;
    expect(label.data, equals('Following'));

    final Color? toggledBackground = _resolveColor(button.style?.backgroundColor);
    final Color? toggledForeground = _resolveColor(button.style?.foregroundColor);

    expect(toggledBackground, isNot(equals(initialBackground)));
    expect(toggledForeground, isNot(equals(initialForeground)));

    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    button = tester.widget<TextButton>(buttonFinder);
    label = button.child! as Text;
    expect(label.data, equals('Follow'));
    expect(_resolveColor(button.style?.backgroundColor), equals(initialBackground));
    expect(_resolveColor(button.style?.foregroundColor), equals(initialForeground));
  });
}
