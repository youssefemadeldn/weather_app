import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLodedState extends WeatherState {
  WeatherLodedState(this.weatherModel);
  final WeatherModel weatherModel;
}

class WeatherFailurState extends WeatherState {}
