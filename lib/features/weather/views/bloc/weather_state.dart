part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  final WeatherResponseModel response;

  const WeatherLoaded({
    required this.response,
  });

  @override
  List<Object> get props => [
        response,
      ];
}

class WeatherError extends WeatherState {
  final String message;

  const WeatherError(this.message);

  @override
  List<Object> get props => [message];
}
