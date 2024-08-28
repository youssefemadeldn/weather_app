import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/views/s/search_view.dart';
import 'package:weather_app/widget/no_weather_body.dart';

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
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherFailure) {
            return const Center(
              child: Text('Something Went wrong...'),
            );
          } else if (state is WeatherSuccess) {
            BlocProvider.of<WeatherCubit>(context).weatherModel!;
            return const SuccessBody();
          } else {
            return const NoWeatherBody();
          }
        },
      ),
    );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: getThemeColor(BlocProvider.of<WeatherCubit>(context)
              .weatherModel!
              .weatherCondition),
          borderRadius: BorderRadius.circular(10),
        ),
        // alignment: Alignment.center,
        height: 200,
        width: 250,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ooops there an was error , pleas',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' try again later',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
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