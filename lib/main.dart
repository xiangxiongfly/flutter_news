import 'package:flutter/material.dart';

import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'news',
      theme: ThemeData(
        primaryColor: const Color(0xFFB90A1B),
      ),
      home: const NewsMainPage(),
    );
  }
}

