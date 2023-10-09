import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/main.dart';
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
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        // this line didt't written by tharwat samy
        // bloc: context.read<GetWeatherCubit>(),
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLodedState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
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
        },
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