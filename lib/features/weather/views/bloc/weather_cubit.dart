import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/features/weather/controllers/weather_controller.dart';
import 'package:weather/features/weather/models/weather_response_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoading());

  final _controller = GetIt.instance<WeatherController>();

  Future<void> getWeather(String cityName) async {
    emit(WeatherLoading());
    try {
      final response = await _controller.getWeather(cityName);
      emit(WeatherLoaded(response: response));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
