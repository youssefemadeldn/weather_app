import 'package:flutter/material.dart';
import 'package:weather_app/widget/no_weather_body.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const NoWeatherBody(),
    );
  }
}
