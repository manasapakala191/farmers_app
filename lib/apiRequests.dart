
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:farmers_app/models/newsModel.dart';
import 'package:farmers_app/models/soilNutrientModel.dart';
import 'package:farmers_app/models/weatherModel.dart';

class APIRequests {
  static const String uri = "192.168.0.103:3000";

  static Future<Nutrients?>? fetchNutrients(double lat, double long) async {
    print(lat);
    final queryParameters = {
      'lat': [lat.toString()],
      'long': [long.toString()],
    };
    final request_uri =
    Uri.http(uri, '/api/v1/nutrients', queryParameters);
    final response = await http.get(request_uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    if(response.statusCode == 200){
      print(response.body);
      return Nutrients.fromJSON(jsonDecode(response.body));
    }
  }

  static Future<WeathersModel?>? fetchWeather(double lat, double long) async {
    final queryParameters = {
      'lat': [lat.toInt().toString()],
      'long': [long.toInt().toString()],
    };
    final request_uri =
    Uri.http(uri, '/api/v1/weather', queryParameters);
    final response = await http.get(request_uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    print(request_uri.path);
    if(response.statusCode == 200){
      print(response.body);
      return WeathersModel.fromJSON(jsonDecode(response.body));
    }
  }

  static Future<NewsListModel?> fetchNews() async {
    final request_uri =
    Uri.http(uri,"/api/v1/news");
    print(request_uri.path);
    final response = await http.get(request_uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    print(request_uri.path);
    if(response.statusCode == 200){
      return NewsListModel.fromJSON(jsonDecode(response.body));
    }
  }

}