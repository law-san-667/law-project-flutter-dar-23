class WeatherModel {
  final String cityName;
  final dynamic temperature;
  final dynamic humidity;
  final String icon;

  WeatherModel(
      {required this.cityName,
      required this.temperature,
      required this.humidity,
      required this.icon});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'],
      humidity: json['main']['humidity'],
      icon: json['weather'][0]['icon'],
    );
  }
}
