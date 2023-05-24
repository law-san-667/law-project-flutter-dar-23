import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/services/services.dart';
import 'package:flutter_exam/view/pages/fail_screen.dart';
import 'package:flutter_exam/view/pages/meteo_screen.dart';
import 'package:provider/provider.dart';

import 'controllers/weather_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherProvider>(
          create: (_) => WeatherProvider(),
        ),
      ],
      child: CupertinoApp(
          routes: {
            '/home': (context) => const MyHomePage(),
            '/fail': (context) => const FailScreen(),
            '/meteo': (context) => const MeteoScreen(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Exam',
          theme: const CupertinoThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 49, 48, 48),
            primaryColor: Colors.black,
            textTheme: CupertinoTextThemeData(
              navLargeTitleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              navTitleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              navActionTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          home: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.black,
        transitionBetweenRoutes: false,
        leading: Text(""),
        middle: Text(
          "Flutter Exam",
          overflow: TextOverflow.ellipsis,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Récupérer les données de météo !!',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/meteo');
                  WeatherService().startActions(context, false);
                },
                child: const Text('FETCH'))
          ],
        ),
      ),
    );
  }
}
