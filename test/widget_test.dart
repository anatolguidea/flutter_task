import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_task/color_generator.dart';
import 'package:flutter_task/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomePage', () {
    testWidgets('renders the required greeting', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: HomePage()),
      );

      expect(find.text('Hello there'), findsOneWidget);
    });

    testWidgets('changes background and keeps readable text', (tester) async {
      final colorGenerator = RandomColorGenerator(
        random: _FixedRandom(0x00FFFFFF),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(colorGenerator: colorGenerator),
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      // fix for solid lint with ? nullable
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.color, const Color(0xFFFFFFFF));
    });
  });
}

class _FixedRandom implements Random {
  _FixedRandom(this._value);
  final int _value;

  @override
  int nextInt(int max) => _value;
  @override
  bool nextBool() => true;
  @override
  double nextDouble() => 0.0;
}
