import 'package:flutter/material.dart';
import 'package:flutter_exam/utils/constants.dart';

import '../models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  double percent = 0.0;
  List<WeatherModel> weatherList = [];
  int messageIndex = 0;
  int counter = 0;
  String message = '';
  bool loading = false;

  get getPercent => percent;
  get getWeatherList => weatherList;
  get getMessageIndex => messageIndex;
  get getCounter => counter;
  get getMessage => messages[messageIndex];
  get getPercentString => (percent * 100).toStringAsFixed(0);
  bool get isLoading => loading;

  set setWeatherList(List<WeatherModel> value) {
    weatherList = value;
    notifyListeners();
  }

  set setMessageIndex(int value) {
    messageIndex = value;
    notifyListeners();
    setMessage = messages[messageIndex];
    notifyListeners();
  }

  set setCounter(int value) {
    counter = value;
    notifyListeners();
  }

  set setPercent(double value) {
    percent = value;
    notifyListeners();
  }

  set setMessage(String value) {
    message = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  void reset() {
    setPercent = 0.00;
    setWeatherList = [];
    setMessageIndex = 0;
    setCounter = 0;
    setLoading(false);
  }

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void incrementPercent() {
    setPercent = double.parse((percent + 0.01).toStringAsFixed(2));
  }

  void addWeatherList(WeatherModel value) {
    weatherList.add(value);
    notifyListeners();
  }

  void incrementMessageIndex(int value) {
    messageIndex += value;
    notifyListeners();
    setMessage = messages[messageIndex];
    notifyListeners();
  }

  Color getPercentColor() {
    if (percent < 0.2) {
      return Colors.red;
    } else if (percent < 0.4) {
      return Colors.orange;
    } else if (percent < 0.6) {
      return Colors.yellow;
    } else if (percent < 0.8) {
      return Colors.blue;
    } else if (percent < 1) {
      return Colors.purple;
    } else {
      return Colors.green;
    }
  }
}
