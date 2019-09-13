import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURLWeather?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURLWeather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a coat just in case';
    }
  }

  String getBackgroundPicture(int condition) {
    if (condition < 300) {
      return 'thunderstorm0.jpg';
    } else if (condition < 400) {
      return 'drizzle.jpg';
    } else if (condition < 600) {
      return 'rain.jpg';
    } else if (condition < 700) {
      return 'snow.jpg';
    } else if (condition < 800) {
      return 'wind.jpg';
    } else if (condition == 800) {
      return 'clear.jpeg';
    } else if (condition <= 804) {
      return 'cloudy.jpg';
    } else {
      return 'errorpic.jpg';
    }
  }
}
