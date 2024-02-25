

import 'package:weather_app/data/models/my_response.dart';
import 'package:weather_app/data/network/api_provider.dart';

class WeatherRepository {
  Future<MyResponse> getSimpleWeatherInfo(String city) =>
      ApiProvider.getSimpleWeatherInfo(city);

  Future<MyResponse> getComplexWeatherInfo() =>
      ApiProvider.getComplexWeatherInfo();
}
