import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            weatherModel.date,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              const SizedBox(width: 45),
              Image(image: NetworkImage('https:${weatherModel.image!}')),
              const SizedBox(width: 60),
              Text(
                weatherModel.temp.toString(),
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 60),
              Column(
                children: [
                  Text('maxTemp: ${weatherModel.maxTemp.round()}'),
                  Text('minTemp: ${weatherModel.minTemp.round()}'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            weatherModel.weatherCondition,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
