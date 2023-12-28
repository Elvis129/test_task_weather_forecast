import 'package:flutter/material.dart';
import 'package:my_weather/screens/location_screen.dart';
import 'package:my_weather/screens/weather_day_forecast_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const LocationScreen(),
        '/weather_day': (context) => const WeatherDayForecastScreen(
              forecastObject: null,
              index: 0,
            ),
      },
    );
  }
}
