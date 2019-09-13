import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/services/forecast.dart';
import 'package:clima/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getWeatherData();
    var forecastData = await ForecastModel().getForecastData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData, forecastData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlurBackground(
                  child: Text(
                    'clima',
                    style: kMessageTextStyle,
                  ),
                ),
                Gap(
                  height: 20.0,
                ),
                SpinKitCubeGrid(
                  color: Colors.white,
                  size: 90.0,
                ),
                Gap(height: 20.0),
                Icon(
                  Icons.cloud_circle,
                  size: 40.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
