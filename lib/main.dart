import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/features/login/login.dart';
import 'package:weather/features/weather/weather.dart';

final _getIt = GetIt.instance;

void main() {
  _getIt.registerSingleton<HttpClient>(HttpClient());
  initLoginFeature();
  initWeatherFeature();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Primary color for app bar and buttons
        primaryColor: const Color(0xFFFFEB3B), // Yellow
        hintColor: const Color(0xFF2D2D2D), // Dark gray

        // Font family
        fontFamily: 'Helvetica',

        // Text theme
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D2D2D), // Dark gray
          ),
          bodyLarge: TextStyle(
            fontSize: 16.0,
            color: Color(0xFF2D2D2D), // Dark gray
          ),
          bodyMedium: TextStyle(
            fontSize: 14.0,
            color: Color(0xFF2D2D2D), // Dark gray
          ),
          labelLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        // Button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: const Color(0xFFFFEB3B),
            textStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Input decoration theme
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFFFEB3B), // Yellow
            ),
          ),
          labelStyle: TextStyle(
            color: Color(0xFF2D2D2D), // Dark gray
          ),
        ),
      ),
      home: LoginPage(),
      routes: {
        WeatherPage.routeName: (context) => const WeatherPage(),
      },
    );
  }
}
