import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/views/bloc/weather_cubit.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  static const routeName = '/weather';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => WeatherCubit()..getWeather('London'),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoaded) {
              final response = state.response;
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Icon(Icons.location_city, size: 30),
                              Text('City: ${response.name}',
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Icon(Icons.thermostat_outlined, size: 30),
                              const SizedBox(height: 10),
                              Text(
                                  'Temperature: ${response.main.temp.toStringAsFixed(2)} K',
                                  style: const TextStyle(fontSize: 18)),
                              Text(
                                  'Temperature: ${(response.main.temp - 273.15).toStringAsFixed(2)} °C',
                                  style: const TextStyle(fontSize: 18)),
                              Text(
                                  'Temperature: ${(response.main.temp * 9 / 5 - 459.67).toStringAsFixed(2)} °F',
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Icon(Icons.wb_sunny, size: 30),
                              const SizedBox(height: 10),
                              Text(
                                  'Feels Like: ${response.main.feelsLike.toStringAsFixed(2)} K',
                                  style: const TextStyle(fontSize: 18)),
                              Text(
                                  'Feels Like: ${(response.main.feelsLike - 273.15).toStringAsFixed(2)} °C',
                                  style: const TextStyle(fontSize: 18)),
                              Text(
                                  'Feels Like: ${(response.main.feelsLike * 9 / 5 - 459.67).toStringAsFixed(2)} °F',
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Icon(Icons.cloud, size: 30),
                              const SizedBox(height: 10),
                              Text(
                                  'Weather: ${response.weather[0].description}',
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Icon(Icons.air, size: 30),
                              const SizedBox(height: 10),
                              Text(
                                  'Wind Speed: ${response.wind.speed.toStringAsFixed(2)} m/s',
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Icon(Icons.water_damage, size: 30),
                              const SizedBox(height: 10),
                              Text('Humidity: ${response.main.humidity}%',
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is WeatherError) {
              return Text('Error: ${state.message}');
            } else {
              return const Text('Something went wrong!');
            }
          },
        ),
      ),
    );
  }
}
