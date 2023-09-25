import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String urlBase = 'https://api.weatherapi.com/v1';
  final String apiKey = '8a4b821c8b174e0ab7940542232509';

  WeatherService({required this.dio});
  Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$urlBase/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on Exception catch (e) {
      return null;
    }
  }
}
