import 'dart:convert';

import 'package:flutter_exam/models/weather_model.dart';
import 'package:flutter_exam/utils/constants.dart';
import 'package:http/http.dart' as http;

Future<WeatherModel> fetchWeather(int count) async {
  String city = cities[count];

  try {
    return await http
        .get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'))
        .then((value) {
      if (value.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(value.body));
      } else {
        throw 'Error in fetchWeather: ${value.body}';
      }
    }).catchError((error) {
      throw 'Error in fetchWeather: $error';
    });
  } catch (e) {
    throw 'Error in fetchWeather: $e';
  }
}
