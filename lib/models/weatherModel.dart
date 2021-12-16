
class WeathersModel {
  WeatherModel? currentWeather;
  List<WeatherModel>? dailyWeather;

  WeathersModel({
    this.currentWeather,
    this.dailyWeather
});

  factory WeathersModel.fromJSON(Map<String, dynamic> json){
    List<WeatherModel> weathers = [];
    json["daily"].forEach((e) {
      weathers.add(WeatherModel.fromJSON(e));
    });
    return WeathersModel(
      currentWeather: WeatherModel.fromJSON(json["current"]),
      dailyWeather: weathers
    );
  }
}

class WeatherModel {
  int? clouds;
  double? dew_point;
  int? humidity;
  double? temp;
  double? minTemp;
  double? maxTemp;
  String? description;
  String? icon;
  int? id;
  String? main;
  double? windSpeed;

  WeatherModel({
    this.clouds,
    this.dew_point,
    this.humidity,
    this.temp,
    this.minTemp,
    this.maxTemp,
    this.description,
    this.icon,
    this.id,
    this.main,
    this.windSpeed,
});

  factory WeatherModel.fromJSON(Map<String, dynamic> json){
    return WeatherModel(
        clouds: json["clouds"],
        dew_point: json["dew_point"].toDouble(),
        humidity: json["humidity"],
        windSpeed: json["wind_speed"].toDouble(),
        temp: ( json["temp"].runtimeType == double ) ? json["temp"] : 0.0,
        minTemp: ( json["temp"].runtimeType == double ) ? 0.0 : json["temp"]["min"],
        maxTemp: ( json["temp"].runtimeType == double ) ? 0.0 : json["temp"]["max"],
        description: json["weather"][0]["description"],
        icon: json["weather"][0]["icon"],
        id: json["weather"][0]["id"],
        main: json["weather"][0]["main"]);
  }
}

Map<String, Object> json_string = {
  "current": {
    "clouds": 100,
    "dew_point": 295.96,
    "dt": 1639321507,
    "feels_like": 304.09,
    "humidity": 74,
    "pressure": 1013,
    "sunrise": 1639272475,
    "sunset": 1639312539,
    "temp": 301.02,
    "uvi": 0,
    "visibility": 10000,
    "weather": [
      {
        "description": "overcast clouds",
        "icon": "04n",
        "id": 804,
        "main": "Clouds"
      }
    ],
    "wind_deg": 353,
    "wind_gust": 7.3,
    "wind_speed": 6.56
  },
  "daily": [
    {
      "clouds": 36,
      "dew_point": 292.97,
      "dt": 1639290600,
      "feels_like": {
        "day": 302.67,
        "eve": 304.04,
        "morn": 301.68,
        "night": 303.79
      },
      "humidity": 61,
      "moon_phase": 0.29,
      "moonrise": 1639296780,
      "moonset": 1639251720,
      "pop": 0,
      "pressure": 1014,
      "sunrise": 1639272475,
      "sunset": 1639312539,
      "temp": {
        "day": 301.12,
        "eve": 301.13,
        "max": 301.36,
        "min": 300.17,
        "morn": 300.37,
        "night": 300.94
      },
      "uvi": 7.49,
      "weather": [
        {
          "description": "scattered clouds",
          "icon": "03d",
          "id": 802,
          "main": "Clouds"
        }
      ],
      "wind_deg": 352,
      "wind_gust": 9.4,
      "wind_speed": 8.18
    },
    {
      "clouds": 53,
      "dew_point": 291.78,
      "dt": 1639377000,
      "feels_like": {
        "day": 301.64,
        "eve": 303.28,
        "morn": 302.04,
        "night": 303.39
      },
      "humidity": 59,
      "moon_phase": 0.32,
      "moonrise": 1639385220,
      "moonset": 1639341120,
      "pop": 0,
      "pressure": 1013,
      "sunrise": 1639358908,
      "sunset": 1639398960,
      "temp": {
        "day": 300.53,
        "eve": 300.93,
        "max": 301.03,
        "min": 300.42,
        "morn": 300.56,
        "night": 300.8
      },
      "uvi": 7.38,
      "weather": [
        {
          "description": "broken clouds",
          "icon": "04d",
          "id": 803,
          "main": "Clouds"
        }
      ],
      "wind_deg": 353,
      "wind_gust": 6.91,
      "wind_speed": 6.33
    },
    {
      "clouds": 48,
      "dew_point": 292.59,
      "dt": 1639463400,
      "feels_like": {
        "day": 301.37,
        "eve": 303.14,
        "morn": 301.6,
        "night": 302.95
      },
      "humidity": 64,
      "moon_phase": 0.35,
      "moonrise": 1639473720,
      "moonset": 1639430400,
      "pop": 0,
      "pressure": 1013,
      "sunrise": 1639445341,
      "sunset": 1639485382,
      "temp": {
        "day": 300.04,
        "eve": 300.79,
        "max": 300.84,
        "min": 299.98,
        "morn": 300.26,
        "night": 300.63
      },
      "uvi": 7.24,
      "weather": [
        {
          "description": "scattered clouds",
          "icon": "03d",
          "id": 802,
          "main": "Clouds"
        }
      ],
      "wind_deg": 358,
      "wind_gust": 8.31,
      "wind_speed": 7.79
    },
    {
      "clouds": 100,
      "dew_point": 291.43,
      "dt": 1639549800,
      "feels_like": {
        "day": 300.99,
        "eve": 302.81,
        "morn": 301.41,
        "night": 302.58
      },
      "humidity": 59,
      "moon_phase": 0.38,
      "moonrise": 1639562280,
      "moonset": 1639519740,
      "pop": 0,
      "pressure": 1013,
      "sunrise": 1639531774,
      "sunset": 1639571805,
      "temp": {
        "day": 300.01,
        "eve": 300.73,
        "max": 300.73,
        "min": 299.87,
        "morn": 300.12,
        "night": 300.43
      },
      "uvi": 7.27,
      "weather": [
        {
          "description": "overcast clouds",
          "icon": "04d",
          "id": 804,
          "main": "Clouds"
        }
      ],
      "wind_deg": 3,
      "wind_gust": 8.12,
      "wind_speed": 7.29
    },
    {
      "clouds": 66,
      "dew_point": 290.95,
      "dt": 1639636200,
      "feels_like": {
        "day": 299.53,
        "eve": 302.36,
        "morn": 301.34,
        "night": 301.89
      },
      "humidity": 59,
      "moon_phase": 0.41,
      "moonrise": 1639650900,
      "moonset": 1639609020,
      "pop": 0,
      "pressure": 1015,
      "sunrise": 1639618206,
      "sunset": 1639658229,
      "temp": {
        "day": 299.53,
        "eve": 300.47,
        "max": 300.47,
        "min": 299.51,
        "morn": 299.83,
        "night": 300.18
      },
      "uvi": 7.7,
      "weather": [
        {
          "description": "broken clouds",
          "icon": "04d",
          "id": 803,
          "main": "Clouds"
        }
      ],
      "wind_deg": 341,
      "wind_gust": 7.5,
      "wind_speed": 7.86
    },
    {
      "clouds": 67,
      "dew_point": 292.1,
      "dt": 1639722600,
      "feels_like": {
        "day": 299.21,
        "eve": 301.52,
        "morn": 299.63,
        "night": 301.48
      },
      "humidity": 65,
      "moon_phase": 0.44,
      "moonrise": 1639739760,
      "moonset": 1639698480,
      "pop": 0,
      "pressure": 1015,
      "sunrise": 1639704638,
      "sunset": 1639744654,
      "temp": {
        "day": 299.21,
        "eve": 299.99,
        "max": 300.06,
        "min": 299.21,
        "morn": 299.63,
        "night": 299.92
      },
      "uvi": 8,
      "weather": [
        {
          "description": "broken clouds",
          "icon": "04d",
          "id": 803,
          "main": "Clouds"
        }
      ],
      "wind_deg": 351,
      "wind_gust": 7.61,
      "wind_speed": 7.62
    },
    {
      "clouds": 3,
      "dew_point": 289.34,
      "dt": 1639809000,
      "feels_like": {
        "day": 298.94,
        "eve": 301.5,
        "morn": 299.24,
        "night": 301.62
      },
      "humidity": 55,
      "moon_phase": 0.47,
      "moonrise": 1639828800,
      "moonset": 1639787940,
      "pop": 0,
      "pressure": 1015,
      "sunrise": 1639791069,
      "sunset": 1639831080,
      "temp": {
        "day": 298.88,
        "eve": 300.24,
        "max": 300.35,
        "min": 298.59,
        "morn": 299.24,
        "night": 300.06
      },
      "uvi": 8,
      "weather": [
        {
          "description": "clear sky",
          "icon": "01d",
          "id": 800,
          "main": "Clear"
        }
      ],
      "wind_deg": 0,
      "wind_gust": 7.9,
      "wind_speed": 7.7
    },
    {
      "clouds": 1,
      "dew_point": 288.9,
      "dt": 1639895400,
      "feels_like": {
        "day": 300.35,
        "eve": 301.81,
        "morn": 299.32,
        "night": 301.88
      },
      "humidity": 51,
      "moon_phase": 0.5,
      "moonrise": 1639918020,
      "moonset": 1639877520,
      "pop": 0,
      "pressure": 1014,
      "sunrise": 1639877500,
      "sunset": 1639917506,
      "temp": {
        "day": 299.85,
        "eve": 300.59,
        "max": 300.6,
        "min": 298.69,
        "morn": 299.01,
        "night": 300.45
      },
      "uvi": 8,
      "weather": [
        {
          "description": "clear sky",
          "icon": "01d",
          "id": 800,
          "main": "Clear"
        }
      ],
      "wind_deg": 359,
      "wind_gust": 7.11,
      "wind_speed": 6.75
    }
  ],
  "lat": 17,
  "lon": 73,
  "timezone": "Asia/Kolkata",
  "timezone_offset": 19800
};