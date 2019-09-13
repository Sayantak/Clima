import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class ForecastScreen extends StatelessWidget {
  final String cityName, forecastDate;
  final List<String> forecastDateStamp;
  final List<String> forecastTimeStamp;
  final List<String> forecastTemperature;
  final List<String> forecastWeatherCondition;

  ForecastScreen(
      {@required this.forecastDateStamp,
      @required this.forecastTimeStamp,
      @required this.forecastTemperature,
      @required this.forecastWeatherCondition,
      @required this.forecastDate,
      @required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        leading: FlatButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: Icon(
//            Icons.arrow_back_ios,
//            size: 20.0,
//          ),
//        ),
//        toolbarOpacity: 0.5,
//      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/forecast.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            constraints: BoxConstraints.expand(),
          ),
          Container(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: BlurBackground(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 30.0,
                          ),
                        ),
                      ),
                      Text(
                        '$cityName on \n${forecastDate.split('-')[2]}-${forecastDate.split('-')[1]}-${forecastDate.split('-')[0]}',
                        style: kForecastPageHeaderTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Gap(
                    height: 20.0,
                  ),
                  Expanded(
                    child: new ListView.builder(
                      itemCount: forecastTimeStamp.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            Line(
                              height: 30.0,
                              color: Colors.white,
                            ),
                            BlurBackground(
                              child: Text(
                                '${forecastTimeStamp[index]}\n${forecastTemperature[index]}°\n${forecastWeatherCondition[index]}',
                                textAlign: TextAlign.center,
                                style: kForecastDateTextStyle,
                              ),
                            ),
//                            Text(
//                              forecastTimeStamp[index],
//                              textAlign: TextAlign.left,
//                              style: kForecastDateTextStyle,
//                            ),
//                            Gap(height: 10.0),
//                            Text(
//                              '${forecastTemperature[index]}°',
//                              textAlign: TextAlign.left,
//                              style: kForecastDateTextStyle,
//                            ),
//                            Gap(
//                              height: 10.0,
//                            ),
//                            Text(
//                              forecastWeatherCondition[index],
//                              textAlign: TextAlign.left,
//                              style: kForecastDateTextStyle,
//                            ),
                            Line(
                              height: 30.0,
                              color: Colors.white,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//class ForecastScreen extends StatefulWidget {
//  final forecastData;
//  final String cityName, forecastDate;
//
//  ForecastScreen(
//      {@required this.forecastData,
//      @required this.forecastDate,
//      @required this.cityName});
//
//  @override
//  _ForecastScreenState createState() => _ForecastScreenState();
//}
//
//class _ForecastScreenState extends State<ForecastScreen> {
//  var forecastData;
//  String forecastDate;
//  String cityName;
//
//  @override
//  void initState() {
//    forecastData = widget.forecastData;
//    forecastDate = widget.forecastDate;
//    cityName = widget.cityName;
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Stack(
//        children: <Widget>[
//          Container(
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage('images/cityBackground.jpg'),
//                fit: BoxFit.cover,
//                colorFilter: ColorFilter.mode(
//                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
//              ),
//            ),
//            constraints: BoxConstraints.expand(),
//          ),
//          ListView(
//            children: <Widget>[
//              Container(
//                child: SafeArea(
//                  child: Column(
//                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
//                          Align(
//                            alignment: Alignment.topLeft,
//                            child: FlatButton(
//                              onPressed: () {
//                                Navigator.pop(context);
//                              },
//                              child: Icon(
//                                Icons.arrow_back_ios,
//                                size: 40.0,
//                              ),
//                            ),
//                          ),
//                          Text(
//                            '$cityName on $forecastDate',
//                            style: kForecastDateTextStyle,
//                          ),
//                        ],
//                      ),
//                      Container(),
//                      Align(),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ],
//      ),
//    );
//  }
//}
//Text(
//'${forecastTimeStamp[0]}',
//textAlign: TextAlign.left,
//style: kForecastDataTextStyle,
//),
//Text(
//'${forecastTemperature[0]}°',
//textAlign: TextAlign.left,
//style: kForecastDataTextStyle,
//),
//Text(
//'${forecastWeatherCondition[0]}',
//textAlign: TextAlign.left,
//style: kForecastDataTextStyle,
//),
