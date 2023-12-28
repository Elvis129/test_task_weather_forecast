import 'package:flutter/material.dart';

import 'package:my_weather/models/weather_forecast_daily.dart';

import 'package:my_weather/widgets/city_view.dart';
import 'package:my_weather/widgets/detail_view.dart';
import 'package:my_weather/widgets/temp_view.dart';

class WeatherDayForecastScreen extends StatefulWidget {
  final int index;
  final WeatherForecast? forecastObject;
  const WeatherDayForecastScreen(
      {Key? key, required this.index, this.forecastObject})
      : super(key: key);

  @override
  State<WeatherDayForecastScreen> createState() =>
      _WeatherDayForecastScreenState();
}

class _WeatherDayForecastScreenState extends State<WeatherDayForecastScreen> {
  WeatherForecast? forecastObjectDay;
  late AsyncSnapshot<WeatherForecast> snapshot;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadForecastData();
  }

  void loadForecastData() async {
    try {
      final forecastData = widget.forecastObject;
      snapshot = AsyncSnapshot.withData(ConnectionState.done, forecastData!);
    } catch (error) {
      snapshot = AsyncSnapshot.withError(ConnectionState.done, error);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade800,
        title: const Text('Weather forecast on day'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        color: Colors.amber.shade600,
        child: ListView(
          children: [
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      CityView(
                        snapshot: snapshot,
                        index: widget.index,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TempView(
                        snapshot: snapshot,
                        index: widget.index,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      DatailView(
                        snapshot: snapshot,
                        index: widget.index,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
