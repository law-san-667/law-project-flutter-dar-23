import 'package:flutter/material.dart';

List<String> messages = [
  'Nous téléchargeons les données...',
  'C’est presque fini...',
  'Plus que quelques secondes avant d’avoir le résultat...',
  'Terminé !',
];
List<String> cities = ['Rennes', 'Paris', 'Nantes', 'Bordeaux', 'Lyon'];

const String apiKey = 'f7ab1522a32f3d35b3f0b3a0fab6407e';
String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

Map<int, Color> progressColors = {
  0: Colors.red,
  20: Colors.orange,
  40: Colors.yellow,
  60: Colors.blue,
  80: Colors.purple,
  100: Colors.green,
};

class Apptheme {
  static TextTheme textTheme = const TextTheme();



}
