import 'package:flutter/cupertino.dart';
import 'package:flutter_exam/controllers/weather_provider.dart';
import 'package:provider/provider.dart';

import '../../services/services.dart';
import '../widgets/loading_widget.dart';
import '../widgets/weather_widget.dart';

class MeteoScreen extends StatefulWidget {
  const MeteoScreen({super.key});

  @override
  State<MeteoScreen> createState() => _MeteoScreenState();
}

class _MeteoScreenState extends State<MeteoScreen> {
  @override
  Widget build(BuildContext context) {
  WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);
    return (weatherProvider.isLoading)
        ? CupertinoPageScaffold(
            child: Center(
              child: LoadingWidget(
                  weatherProvider:
                      weatherProvider),
            ),
          )
        : CupertinoPageScaffold(
            navigationBar: WeatherService().getMeteoNavBar(
                weatherProvider, context),
            child: Center(
                child: WeatherWidget(
                    weatherProvider:
                        weatherProvider)),
          );
  }
}
