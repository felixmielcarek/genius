import 'package:flutter/material.dart';

import 'application_layer/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genius',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: const Color(0x007584ff),
        ),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
