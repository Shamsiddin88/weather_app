import 'package:flutter/material.dart';
import 'package:weather_app/screens/simple_weather_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: SimpleWeatherScreen(),
    ),
  );
}
