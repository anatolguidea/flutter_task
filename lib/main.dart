import 'package:flutter/material.dart';
import 'package:flutter_task/home_page.dart';

void main() {
  runApp(const HelloThereApp());
}

/// Root widget of the Flutter application.
class HelloThereApp extends StatelessWidget {
  /// Creates a [HelloThereApp].
  const HelloThereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
