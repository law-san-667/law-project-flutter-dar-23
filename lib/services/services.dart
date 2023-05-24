import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/controllers/weather_provider.dart';
import 'package:flutter_exam/services/api_service.dart';
import 'package:provider/provider.dart';

class WeatherService {
  void startActions(BuildContext context, bool isRetry) {
    Provider.of<WeatherProvider>(context, listen: false)
      ..reset()
      ..setLoading(true);

    messageAnimator(context);
    progressBarAnimator(context);
    incrementPercentage(context);
  }

  void messageAnimator(BuildContext context) {
    WeatherProvider weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    if (!weatherProvider.isLoading) {
      return;
    }

    Future.delayed(const Duration(seconds: 6), () {
      if (weatherProvider.messageIndex == 2) {
        weatherProvider.setMessageIndex = 0;
      } else {
        weatherProvider.incrementMessageIndex(1);
      }
      if (weatherProvider.isLoading) {
        messageAnimator(context);
      } else {
        weatherProvider.setMessageIndex = 0;
      }
    }).catchError((error) {
      log("Error in messageAnimator : $error");
      weatherProvider.reset();
      Navigator.pushNamed(context, '/fail');
    });
  }

  void incrementPercentage(BuildContext context) async {
    WeatherProvider weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    if (!weatherProvider.isLoading) {
      return;
    }

    await Future.delayed(const Duration(milliseconds: 60), () {
      if (weatherProvider.percent < 1) {
        weatherProvider.incrementPercent();
        log(weatherProvider.getPercentString);
        incrementPercentage(context);
      }
    });
  }

  void progressBarAnimator(context) {
    WeatherProvider weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    if (!weatherProvider.isLoading) {
      return;
    }

    Future.delayed(const Duration(seconds: 1), () async {
      await fetchWeather(weatherProvider.counter).then((value) async {
        weatherProvider.addWeatherList(value);
        if (weatherProvider.getCounter == 4) {
          Future.delayed(const Duration(seconds: 1), () {
            weatherProvider.setLoading(false);
            weatherProvider.setPercent = 0.0;
            log(weatherProvider.getPercentString);
          });
        } else {
          weatherProvider.incrementCounter();
          progressBarAnimator(context);
        }
      }).catchError((error) {
        log("$error");
        weatherProvider.reset();
        Navigator.pushNamed(context, '/fail');
      });
    }).catchError((error) {
      log("Error in progressBarAnimator: $error");
      weatherProvider.reset();
      Navigator.pushNamed(context, '/fail');
    });
  }

  IconData getWeatherIcon(String icon) {
    switch (icon) {
      case "01d":
        return CupertinoIcons.sun_max;
      case "01n":
        return CupertinoIcons.moon;
      case "02d":
        return CupertinoIcons.cloud_sun;
      case "02n":
        return CupertinoIcons.cloud_moon;
      case "03d":
        return CupertinoIcons.cloud;
      case "03n":
        return CupertinoIcons.cloud;
      case "04d":
        return CupertinoIcons.cloud_fill;
      case "04n":
        return CupertinoIcons.cloud_fill;
      case "09d":
        return CupertinoIcons.cloud_drizzle;
      case "09n":
        return CupertinoIcons.cloud_drizzle;
      case "10d":
        return CupertinoIcons.cloud_rain;
      case "10n":
        return CupertinoIcons.cloud_rain;
      case "11d":
        return CupertinoIcons.cloud_bolt;
      case "11n":
        return CupertinoIcons.cloud_bolt;
      case "13d":
        return CupertinoIcons.cloud_snow;
      case "13n":
        return CupertinoIcons.cloud_snow;
      case "50d":
        return CupertinoIcons.cloud_fog;
      case "50n":
        return CupertinoIcons.cloud_fog;
      default:
        return CupertinoIcons.cloud;
    }
  }

  CupertinoNavigationBar getMeteoNavBar(
      WeatherProvider weatherProvider, BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: Colors.black,
      transitionBetweenRoutes: false,
      leading: (weatherProvider.isLoading)
          ? const Text('')
          : GestureDetector(
              onTap: () {
                weatherProvider.reset();
                Navigator.pop;
              },
              child: const Icon(
                CupertinoIcons.arrow_left,
                color: Colors.white,
              ),
            ),
      middle: const Text(
        style: TextStyle(color: Colors.white),
        "Météo",
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
