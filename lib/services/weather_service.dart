import 'dart:developer';
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
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there was an error , try again later';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw const ExactAssetImage('oops there was an error , try again later');
    }
  }
}
