import 'package:flutter/material.dart';
import 'package:flutter_task/color_generator.dart';

/// The main screen of the application.
class HomePage extends StatefulWidget {
  /// Creates a [HomePage].
  const HomePage({
    super.key,
    this.colorGenerator = const RandomColorGenerator(),
  });

  /// The logic used to generate colors.
  final RandomColorGenerator colorGenerator;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _animationDuration = Duration(milliseconds: 300);

  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;

  void _handleTap() {
    final newColor = widget.colorGenerator.generateColor();
    setState(() {
      _backgroundColor = newColor;
      _textColor = widget.colorGenerator.getContrastingTextColor(newColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _handleTap,
        child: AnimatedContainer(
          duration: _animationDuration,
          color: _backgroundColor,
          child: Center(
            child: Text(
              'Hello there',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: _textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
