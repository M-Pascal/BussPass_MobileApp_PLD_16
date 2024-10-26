import 'package:flutter/material.dart';
import 'screens/root_screen.dart';
import 'config/theme.dart';
void main() {
  runApp(const BussPassApp());
}

class BussPassApp extends StatelessWidget {
  const BussPassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BussPass',
      theme: AppTheme.lightTheme,
      home: const RootScreen(),
    );
  }
}