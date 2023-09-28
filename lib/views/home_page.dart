import 'package:flutter/material.dart';
import 'package:weather_app/views/s/search_view.dart';
import 'package:weather_app/widget/no_weather_body.dart';
import 'package:weather_app/widget/weather_info_body.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        // backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: weatherModel == null
          ? const NoWeatherBody()
          : const WeatherInfoBody(),
    );
  }
}



/* steps:
  - create state
  - create cubit
  - create function 
  - provide cubit
  - integrate cubit
  - trigger cubit
*/