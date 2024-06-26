import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/models/detail/one_call_data.dart';
import 'package:weather_app/data/models/my_response.dart';
import 'package:weather_app/data/models/simple/weather_main_model.dart';
import 'package:weather_app/utils/constants/app_constants.dart';

class ApiProvider {
  static Future<MyResponse> getSimpleWeatherInfo(String city) async {
    Map<String, String> _queryParams = {
      "appid": AppConstants.apiKey,
      "q": city,
    };

    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/data/2.5/weather",
      _queryParams,
    );

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return MyResponse(
            data: WeatherMainModel.fromJson(jsonDecode(response.body)));
      } else {
        return MyResponse(errorText: "OTHER ERROR:${response.statusCode}");
      }
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> getComplexWeatherInfo() async {
    Map<String, String> _queryParams = {
      "lat": "41.2646",
      "lon": "69.2163",
      "units": "metric",
      "exclude": "minutely,current",
      "appid": AppConstants.complexApiKey2,
    };

    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/data/2.5/onecall",
      _queryParams,
    );

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return MyResponse(
            data: OneCallData.fromJson(jsonDecode(response.body)));
      } else {
        return MyResponse(errorText: "OTHER ERROR:${response.statusCode}");
      }
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }
}
