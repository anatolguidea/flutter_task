import 'dart:math';
import 'package:flutter/material.dart';

/// Service responsible for generating random colors and contrast colors.
final class RandomColorGenerator {
  /// Creates a [RandomColorGenerator].
  const RandomColorGenerator({
    Random? random,
  }) : _random = random;

  final Random? _random;

  /// Returns a random color from all 16,777,216 RGB combinations.
  Color generateColor() {
    final random = _random ?? Random();
    final rgbValue = random.nextInt(1 << 24);

    return Color(0xFF000000 | rgbValue);
  }

  /// Chooses a readable text color for the provided [backgroundColor].
  Color getContrastingTextColor(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
  }
}
