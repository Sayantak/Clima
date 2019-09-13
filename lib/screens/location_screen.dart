import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/forecast.dart';
import 'package:clima/screens/forecast_screen.dart';

class LocationScreen extends StatefulWidget {
  final weatherData, forecastData;

  LocationScreen(this.weatherData, this.forecastData);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  ForecastModel forecastModel = ForecastModel();
  int forecastDateValidator;
  String temperature;
  String cityName;
  String weatherIcon;
  String weatherMessage;
  String weatherMessagePreposition;
  String temperatureSuffix;
  String backgroundPicture;
  String forecastTag;
  String dateConnector;
  bool foreCastDataEnable;
  List<String> forecastDateStamp = [' - - '];

  List<String> forecastTimeStamp1 = List();
  List<String> forecastTemperature1 = List();
  List<String> forecastWeatherCondition1 = List();

  List<String> forecastTimeStamp2 = List();
  List<String> forecastTemperature2 = List();
  List<String> forecastWeatherCondition2 = List();

  List<String> forecastTimeStamp3 = List();
  List<String> forecastTemperature3 = List();
  List<String> forecastWeatherCondition3 = List();

  List<String> forecastTimeStamp4 = List();
  List<String> forecastTemperature4 = List();
  List<String> forecastWeatherCondition4 = List();

  List<String> forecastTimeStamp5 = List();
  List<String> forecastTemperature5 = List();
  List<String> forecastWeatherCondition5 = List();

  List<String> forecastTimeStamp6 = List();
  List<String> forecastTemperature6 = List();
  List<String> forecastWeatherCondition6 = List();

  @override
  void initState() {
    updateUI(widget.weatherData, widget.forecastData, '');
    super.initState();
  }

  void getForecastData(List data) {
    for (int i = 0; i < data.length; i++) {
      forecastDateStamp.add((data[i]['dt_txt']).split(" ")[0]);
    }
    List<String> dates = forecastDateStamp.toSet().toList();
    forecastDateStamp.clear();
    forecastDateStamp = [' - - '];
    for (int i = 0; i < data.length; i++) {
      forecastDateStamp.add((data[i]['dt_txt']).split(" ")[0]);
      if (dates[1] == forecastDateStamp[i + 1]) {
        forecastTimeStamp1.add((data[i]['dt_txt']).split(" ")[1]);
        forecastTemperature1.add(data[i]['main']['temp'].toStringAsFixed(1));
        forecastWeatherCondition1.add(data[i]['weather'][0]['main']);
      }
    }
    forecastDateStamp.clear();
    forecastDateStamp = [' - - '];
    for (int i = 0; i < data.length; i++) {
      forecastDateStamp.add((data[i]['dt_txt']).split(" ")[0]);
      if (dates[2] == forecastDateStamp[i + 1]) {
        forecastTimeStamp2.add((data[i]['dt_txt']).split(" ")[1]);
        forecastTemperature2.add(data[i]['main']['temp'].toStringAsFixed(1));
        forecastWeatherCondition2.add(data[i]['weather'][0]['main']);
      }
    }
    forecastDateStamp.clear();
    forecastDateStamp = [' - - '];
    for (int i = 0; i < data.length; i++) {
      forecastDateStamp.add((data[i]['dt_txt']).split(" ")[0]);
      if (dates[3] == forecastDateStamp[i + 1]) {
        forecastTimeStamp3.add((data[i]['dt_txt']).split(" ")[1]);
        forecastTemperature3.add(data[i]['main']['temp'].toStringAsFixed(1));
        forecastWeatherCondition3.add(data[i]['weather'][0]['main']);
      }
    }
    forecastDateStamp.clear();
    forecastDateStamp = [' - - '];
    for (int i = 0; i < data.length; i++) {
      forecastDateStamp.add((data[i]['dt_txt']).split(" ")[0]);
      if (dates[4] == forecastDateStamp[i + 1]) {
        forecastTimeStamp4.add((data[i]['dt_txt']).split(" ")[1]);
        forecastTemperature4.add(data[i]['main']['temp'].toStringAsFixed(1));
        forecastWeatherCondition4.add(data[i]['weather'][0]['main']);
      }
    }
    forecastDateStamp.clear();
    forecastDateStamp = [' - - '];
    for (int i = 0; i < data.length; i++) {
      forecastDateStamp.add((data[i]['dt_txt']).split(" ")[0]);
      if (dates[5] == forecastDateStamp[i + 1]) {
        forecastTimeStamp5.add((data[i]['dt_txt']).split(" ")[1]);
        forecastTemperature5.add(data[i]['main']['temp'].toStringAsFixed(1));
        forecastWeatherCondition5.add(data[i]['weather'][0]['main']);
      }
    }
    forecastDateStamp.clear();
    forecastDateStamp = [' - - '];
    for (int i = 0; i < data.length; i++) {
      forecastDateStamp.add((data[i]['dt_txt']).split(" ")[0]);
      if (dates[6] == forecastDateStamp[i + 1]) {
        forecastTimeStamp6.add((data[i]['dt_txt']).split(" ")[1]);
        forecastTemperature6.add(data[i]['main']['temp'].toStringAsFixed(1));
        forecastWeatherCondition6.add(data[i]['weather'][0]['main']);
      }
    }
    forecastDateStamp.clear();
    forecastDateStamp = [' - - '];
  }

  void updateUI(
      dynamic weatherData, dynamic forecastData, String easterCityName) {
    setState(() {
      foreCastDataEnable = false;
      forecastDateStamp.clear();
      forecastDateStamp = [' - - '];
      forecastTimeStamp1.clear();
      forecastTemperature1.clear();
      forecastWeatherCondition1.clear();

      forecastTimeStamp2.clear();
      forecastTemperature2.clear();
      forecastWeatherCondition2.clear();

      forecastTimeStamp3.clear();
      forecastTemperature3.clear();
      forecastWeatherCondition3.clear();

      forecastTimeStamp4.clear();
      forecastTemperature4.clear();
      forecastWeatherCondition4.clear();

      forecastTimeStamp5.clear();
      forecastTemperature5.clear();
      forecastWeatherCondition5.clear();

      forecastTimeStamp6.clear();
      forecastTemperature6.clear();
      forecastWeatherCondition6.clear();
      if (weatherData == null) {
        temperature = '';
        weatherIcon = '';
        if (easterCityName == 'La La Land' ||
            easterCityName == 'la la land' ||
            easterCityName == 'lalaland' ||
            easterCityName == 'LaLaLand' ||
            easterCityName == 'La la land' ||
            easterCityName == 'Lalaland') {
          weatherMessage =
              'It\'s very romantic in La La Land!\n Hear the city of stars being hummed';
        } else if (easterCityName == 'Antland' ||
            easterCityName == 'antland' ||
            easterCityName == 'antLand') {
          weatherMessage = 'Error!\nToo busy gathering food to report weather';
        } else {
          weatherMessage = 'Error!\nUnable to get weather data';
        }
        cityName = '';
        weatherMessagePreposition = '';
        temperatureSuffix = '';
        backgroundPicture = 'errorpic.jpg';
        forecastTag = '';
        forecastDateValidator = 0;
        dateConnector = '';
        return;
      }
      int condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      temperature = weatherData['main']['temp'].toStringAsFixed(1);
      weatherMessage =
          weatherModel.getMessage(double.parse(temperature).toInt());
      cityName = weatherData['name'];
      weatherMessagePreposition = 'in';
      temperatureSuffix = '°';
      backgroundPicture = weatherModel.getBackgroundPicture(condition);
      forecastTag = 'Forecast';
      List data = forecastData['list'];
      getForecastData(data);
      forecastDateStamp.clear();
      forecastDateStamp = [' - - '];
      for (int i = 0; i < data.length; i++) {
        forecastDateStamp.add((data[i]['dt_txt']).split(" ")[0]);
      }
      forecastDateStamp = forecastDateStamp.toSet().toList();
      forecastDateValidator = 1;
      dateConnector = '-';
      foreCastDataEnable = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/$backgroundPicture'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            constraints: BoxConstraints.expand(),
          ),
          ListView(
            children: <Widget>[
              Container(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: BlurBackground(
                                child: Icon(
                                  Icons.location_on, //near_me
                                  size: 50.0,
                                ),
                              ),
                              onTap: () async {
                                var weatherData =
                                    await weatherModel.getWeatherData();
                                var forecastData =
                                    await forecastModel.getForecastData();
                                updateUI(weatherData, forecastData, '');
                              },
                            ),
                          ),
                          FlatButton(
                            onPressed: () async {
                              var typedName = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CityScreen();
                                  },
                                ),
                              );
                              if (typedName != null) {
                                var weatherData = await weatherModel
                                    .getCityWeather(typedName);
                                var forecastData = await forecastModel
                                    .getCityForecast(typedName);
                                updateUI(weatherData, forecastData, typedName);
                              }
                            },
                            child: BlurBackground(
                              child: Icon(
                                Icons.location_city,
                                size: 50.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(height: 80.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '$temperature$temperatureSuffix',
                              style: kTempTextStyle,
                            ),
                            Text(
                              weatherIcon,
                              style: kConditionTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Gap(height: 80.0),
                      Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Text(
                          "$weatherMessage $weatherMessagePreposition $cityName!",
                          textAlign: TextAlign.right,
                          style: kMessageTextStyle,
                        ),
                      ),
                      Gap(height: 60.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          '$forecastTag',
                          style: kMessageTextStyle, //kForecastDataTextStyle
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Gap(height: 10.0),
                      Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          BlurBackground(
                            child: ForecastDateButton(
                              forecastDateStamp: forecastDateStamp,
                              index: (1 * forecastDateValidator),
                              dateConnector: dateConnector,
                              forecastTimeStamp: forecastTimeStamp1,
                              forecastTemperature: forecastTemperature1,
                              forecastWeatherCondition:
                                  forecastWeatherCondition1,
                              cityName: cityName,
                              forecastDataEnable: foreCastDataEnable,
                            ),
                          ),
                          Gap(height: 15.0),
                          BlurBackground(
                            child: ForecastDateButton(
                              forecastDateStamp: forecastDateStamp,
                              index: (2 * forecastDateValidator),
                              dateConnector: dateConnector,
                              forecastTimeStamp: forecastTimeStamp2,
                              forecastTemperature: forecastTemperature2,
                              forecastWeatherCondition:
                                  forecastWeatherCondition2,
                              cityName: cityName,
                              forecastDataEnable: foreCastDataEnable,
                            ),
                          ),
                          Gap(height: 15.0),
                          BlurBackground(
                            child: ForecastDateButton(
                              forecastDateStamp: forecastDateStamp,
                              index: (3 * forecastDateValidator),
                              dateConnector: dateConnector,
                              forecastTimeStamp: forecastTimeStamp3,
                              forecastTemperature: forecastTemperature3,
                              forecastWeatherCondition:
                                  forecastWeatherCondition3,
                              cityName: cityName,
                              forecastDataEnable: foreCastDataEnable,
                            ),
                          ),
                          Gap(height: 15.0),
                          BlurBackground(
                            child: ForecastDateButton(
                              forecastDateStamp: forecastDateStamp,
                              index: (4 * forecastDateValidator),
                              dateConnector: dateConnector,
                              forecastTimeStamp: forecastTimeStamp4,
                              forecastTemperature: forecastTemperature4,
                              forecastWeatherCondition:
                                  forecastWeatherCondition4,
                              cityName: cityName,
                              forecastDataEnable: foreCastDataEnable,
                            ),
                          ),
                          Gap(height: 15.0),
                          BlurBackground(
                            child: ForecastDateButton(
                              forecastDateStamp: forecastDateStamp,
                              index: (5 * forecastDateValidator),
                              dateConnector: dateConnector,
                              forecastTimeStamp: forecastTimeStamp5,
                              forecastTemperature: forecastTemperature5,
                              forecastWeatherCondition:
                                  forecastWeatherCondition5,
                              cityName: cityName,
                              forecastDataEnable: foreCastDataEnable,
                            ),
                          ),
                          Gap(height: 15.0),
                          BlurBackground(
                            child: ForecastDateButton(
                              forecastDateStamp: forecastDateStamp,
                              index: (6 * forecastDateValidator),
                              dateConnector: dateConnector,
                              forecastTimeStamp: forecastTimeStamp6,
                              forecastTemperature: forecastTemperature6,
                              forecastWeatherCondition:
                                  forecastWeatherCondition6,
                              cityName: cityName,
                              forecastDataEnable: foreCastDataEnable,
                            ),
                          ),
                          Gap(height: 10.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ForecastDateButton extends StatelessWidget {
  ForecastDateButton({
    @required this.forecastDateStamp,
    @required this.forecastTimeStamp,
    @required this.forecastTemperature,
    @required this.forecastWeatherCondition,
    @required this.index,
    @required this.dateConnector,
    @required this.cityName,
    @required this.forecastDataEnable,
  });

  final List<String> forecastDateStamp;
  final int index;
  final String cityName;
  final String dateConnector;
  final List<String> forecastTimeStamp;
  final List<String> forecastTemperature;
  final List<String> forecastWeatherCondition;
  final bool forecastDataEnable;

  Function isEnabled(BuildContext context) {
    if (!forecastDataEnable) {
      return null;
    } else {
      return () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ForecastScreen(
                forecastDateStamp: forecastDateStamp,
                forecastTimeStamp: forecastTimeStamp,
                forecastTemperature: forecastTemperature,
                forecastWeatherCondition: forecastWeatherCondition,
                forecastDate: forecastDateStamp[index],
                cityName: cityName);
          }),
        );
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: isEnabled(context),
      child: Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text(
          '${(forecastDateStamp[index]).split('-')[2]}$dateConnector${(forecastDateStamp[index]).split('-')[1]}$dateConnector${(forecastDateStamp[index]).split('-')[0]}',
          style: kForecastDateTextStyle,
        ),
      ),
    );
  }
}

//Column(
//mainAxisAlignment: MainAxisAlignment.center,
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//Text(
//'${forecastTimeStamp[0]}',
//textAlign: TextAlign.left,
//style: kForecastDataTextStyle,
//),
//Text(
//'${forecastTemperature[0]}$temperatureSuffix',
//textAlign: TextAlign.left,
//style: kForecastDataTextStyle,
//),
//Text(
//'${forecastWeatherCondition[0]}',
//textAlign: TextAlign.left,
//style: kForecastDataTextStyle,
//),
//],
//)
