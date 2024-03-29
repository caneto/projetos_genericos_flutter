import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class WeatherData {

  WeatherData();

  late double temp;
  late String description;
  late double feelLike;
  late double maxTemp;
  late double minTemp;
  late String humidity;
  late String pressure;
  late String seaLevel;
  late String grandLevel;
  late double speed;
  late String sunrise;
  late String sunset;
  Future<void> getData(String location) async {
    try {
      final response = await http.get(
        Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=$location&appid=bfd09eed788156cb5b0cd7b9de11227a",
        ),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        // Getting Temp, Humidity
        final Map<String, dynamic> tempData = data['main'];
        humidity = tempData['humidity'].toString();
        temp = tempData['temp'].toDouble();
        feelLike = tempData['feels_like'].toDouble();
        minTemp = tempData['temp_min'].toDouble();
        maxTemp = tempData['temp_max'].toDouble();
        pressure = tempData['pressure'].toString();
        seaLevel = tempData['sea_level'].toString();
        grandLevel = tempData['grnd_level'].toString();

        // Getting air_speed
        final Map<String, dynamic> wind = data['wind'];
        speed = wind['speed'].toDouble();

        // Getting Description
        final List<dynamic> weatherData = data['weather'];
        final Map<String, dynamic> weatherMainData = weatherData[0];
        description = weatherMainData['description'];

        // Getting system
        final Map<String, dynamic> sys = data['sys'];
        sunrise = sys['sunrise'].toString();
        sunset = sys['sunset'].toString();

        //Getting visibility

      } else {
        // Handle API request error
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      // Handle other exceptions, such as network errors
      if (kDebugMode) {
        print('Error: $e');
      }
      // You can add additional error handling logic here
    }
  }
}