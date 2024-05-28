import 'package:get_it/get_it.dart';
import 'package:weather/features/weather/controllers/weather_controller.dart';
import 'package:weather/features/weather/views/bloc/weather_cubit.dart';

export 'package:weather/features/weather/views/weather_page.dart';

final _getIt = GetIt.instance;

void initWeatherFeature() {
  _getIt.registerFactory<WeatherController>(WeatherControllerImpl.new);
  _getIt.registerFactory<WeatherCubit>(WeatherCubit.new);
}
