import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(InitialWeatherStat());

  WeatherService weatherService;
  WeatherModel? weatherModel;

  void getWeatherByWeatherCubit({required String cityName}) async {
    try {
      weatherModel = await weatherService.getCurrentWeather(cityName: cityName);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
