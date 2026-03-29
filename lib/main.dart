import 'package:flutter/material.dart';
import 'package:selfcare_app/screens/home_page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selfcare App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(255, 174, 209, 1),
          primary: Color.fromRGBO(255, 174, 209, 1)
        )
      ),
      home: const HomePage(),
    );
  }
}

