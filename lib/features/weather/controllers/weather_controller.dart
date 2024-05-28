import 'dart:convert';

import 'package:weather/features/weather/models/weather_response_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherController {
  Future<WeatherResponseModel> getWeather(String cityName);
}

class WeatherControllerImpl implements WeatherController {
  static const _apiKey = '';

  @override
  Future<WeatherResponseModel> getWeather(String cityName) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName,UK&APPID=$_apiKey');
    final response = await http.get(url);

    try {
      final json = jsonDecode(response.body);
      return WeatherResponseModel.fromJson(json);
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }
}
