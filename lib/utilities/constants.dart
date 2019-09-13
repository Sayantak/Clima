import 'package:flutter/material.dart';
import 'dart:ui';

const String apiKey = '93d5d54b26b05c34a37371a0dfd503ae';
const openWeatherMapURLWeather =
    'https://api.openweathermap.org/data/2.5/weather';
const openWeatherMapURLForecast =
    'https://api.openweathermap.org/data/2.5/forecast';

const kTempTextStyle = TextStyle(
  fontFamily: 'Comfortaa',
  fontSize: 80.0, //75
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Comfortaa',
  fontSize: 45.0, //40
);

const kForecastDateTextStyle = TextStyle(
  fontFamily: 'Comfortaa',
  fontSize: 30.0, //25
);

const kForecastDataTextStyle = TextStyle(
  fontFamily: 'Comfortaa',
  fontSize: 50.0, //40
);

const kForecastPageHeaderTextStyle = TextStyle(
  fontFamily: 'Comfortaa',
  fontSize: 30.0, //40
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0, //30
  fontFamily: 'Comfortaa',
);

const kConditionTextStyle = TextStyle(
  fontSize: 80.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
);

class Gap extends StatelessWidget {
  final double height;
  Gap({this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class Line extends StatelessWidget {
  const Line({@required this.height, @required this.color});
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: 150.0,
      child: Divider(
        color: color,
      ),
    );
  }
}

class CustomBoxShadow extends BoxShadow {
  final BlurStyle blurStyle;

  const CustomBoxShadow({
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    this.blurStyle = BlurStyle.normal,
  }) : super(color: color, offset: offset, blurRadius: blurRadius);

  @override
  Paint toPaint() {
    final Paint result = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(this.blurStyle, blurSigma);
    assert(() {
      if (debugDisableShadows) result.maskFilter = null;
      return true;
    }());
    return result;
  }
}

class BlurBackground extends StatelessWidget {
  const BlurBackground({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double _borderRadius = 15.0;

    return Container(
      decoration: BoxDecoration(
//          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(_borderRadius),
          boxShadow: const [
            CustomBoxShadow(
                color: Colors.white,
                blurRadius: 5.0,
                offset: Offset.zero,
                blurStyle: BlurStyle.outer)
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
