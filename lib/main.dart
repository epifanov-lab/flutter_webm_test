import 'package:flutter/material.dart';
import 'package:webm_test/god_controller.dart';
import 'package:webm_test/test_page_3.dart';

final GodController god = GodController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        backgroundColor: Colors.black38,
        body: TestPage3(),
      ),
    );
  }
}
