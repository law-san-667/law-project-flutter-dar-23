import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../controllers/weather_provider.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.weatherProvider,
  });

  final WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer<WeatherProvider>(
          builder: (context, message, child) => Text(
            weatherProvider.getMessage,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 50,
            lineHeight: 40.0,
            animationDuration: 900,
            animation: true,
            animateFromLastPercent: true,
            percent: (weatherProvider.getPercent),
            center: Text(
              "${(weatherProvider.getPercentString)}%",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            barRadius: const Radius.circular(10.0),
            progressColor: weatherProvider.getPercentColor(),
          ),
        ),
      ],
    );
  }
}
