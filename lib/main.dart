import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:selfcare_app/config/route_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const _mainColor = Color.fromRGBO(255, 174, 209, 1);
    return MaterialApp.router(
      title: 'Selfcare App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _mainColor,
          primary: _mainColor
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Color.fromRGBO(141, 141, 141, 1),
            fontWeight: FontWeight.normal
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: _mainColor,
              width: 2
            )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: const Color.fromRGBO(255, 0, 0, 1),
              width: 1
            )
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: const Color.fromRGBO(255, 0, 0, 1),
              width: 1
            )
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        )
      ),
      routerConfig: router,
    );
  }
}

