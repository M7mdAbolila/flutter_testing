import 'package:flutter/material.dart';
import 'package:flutter_testing/my_widget.dart';

void main() {
  runApp(
    const MyWidget(title: 'Widget test ', message: 'This is a widget test'),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: Scaffold());
  }
}
