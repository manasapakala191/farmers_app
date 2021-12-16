
/// TODO: 2 tabs with current and week's weather forecast

// import 'package:charts_flutter/flutter.dart';
import 'package:farmers_app/apiRequests.dart';
import 'package:farmers_app/models/locationModel.dart';
import 'package:farmers_app/models/weatherModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class WeatherTab extends StatelessWidget {
  const WeatherTab({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat('MMMMd').format(dateTime);
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) {
        return FutureBuilder<WeathersModel?>(
          future: APIRequests.fetchWeather(locationProvider.latitude, locationProvider.longitude),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              if(snapshot.hasError){
                print(snapshot.error.toString());
                return Column(
                  children: [
                    IconButton(onPressed: () async {
                      WeathersModel? weathers = await APIRequests.fetchWeather(locationProvider.latitude, locationProvider.longitude);
                    }, icon: const Icon(Icons.refresh)),
                    const Text("Couldn't load weather data"),
                  ],
                );}
              else {
                WeathersModel? weathersModel = snapshot.data;
                return Container(
                  padding: const EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children:  [
                                      Text("Today, "+ formattedDate , style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),),
                                      Text(locationProvider.area ?? "Area Name",
                                        style: TextStyle(fontSize: 25),),
                                    ],
                                  ),
                                  const Icon(Icons.location_on_sharp, size: 40,)
                                ],
                              ),
                            ),
                            Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Column(
                                children: [
                                  Image.network(
                                    'http://openweathermap.org/img/wn/' + weathersModel!.currentWeather!.icon!  + '@4x.png',
                                    height: _screenSize.height * 0.2,
                                    width: _screenSize.height * 0.2,
                                    fit: BoxFit.cover,
                                  ),

                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 8.0),
                            //   child: Text(weathersModel.currentWeather!.main!, style: const TextStyle(
                            //       color: Colors.black87, fontSize: 30),),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                              child: Text(weathersModel.currentWeather!.description!.split(' ').map((e) => e[0].toUpperCase()+e.substring(1)).toList().join(" "), style: const TextStyle(
                                  color: Colors.black87, fontSize: 20),),
                            ),
                            Card(
                              elevation: 10,
                              color: Colors.green,
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: _screenSize.width * 0.25,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            const Text("Wind Speed", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),),
                                            Text(weathersModel.currentWeather!.windSpeed!.toString(), style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(5),
                                        height: 60,
                                        width: 2,
                                        decoration: const BoxDecoration(
                                          // border: Border.all(color: Colors.white),
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: _screenSize.width * 0.25,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            const Text(
                                              "Temparature", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),),
                                            Text(weathersModel.currentWeather!.temp.toString() +" *F", style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),)
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(5),
                                        height: 60,
                                        width: 2,
                                        decoration: const BoxDecoration(
                                          // border: Border.all(color: Colors.white),
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: _screenSize.width * 0.25,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            const Text("Humidity", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),),
                                            Text(weathersModel.currentWeather!.humidity.toString() + " %", style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),)
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      DraggableScrollableSheet(
                        initialChildSize: 0.35,
                        minChildSize: 0.35,
                        maxChildSize: 0.85,
                        builder: (BuildContext context, scrollController) {
                          return Card(
                            elevation: 10,
                            color: const Color(0xff5C6784),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: ListView(
                                // shrinkWrap: true,
                                controller: scrollController,
                                children: [
                                  const Icon(
                                    Icons.maximize_rounded,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: _screenSize.height * 0.13,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemCount: 7,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        DateTime _dailyDate = dateTime.add(Duration(days: index+1));
                                        String _fDailyDate = DateFormat('Md').format(_dailyDate);
                                        return Container(
                                          child: Column(
                                            children: [
                                              Text(_fDailyDate,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),),
                                              Image.network(
                                                'http://openweathermap.org/img/wn/' + weathersModel.dailyWeather![index].icon!  + '@2x.png',
                                                height: _screenSize.width * 0.1,
                                                width: _screenSize.width * 0.1,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                width: _screenSize.width * 0.1,
                                                child: Text(weathersModel.dailyWeather![index].description!, style: const TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 10),textAlign: TextAlign.center,),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const Padding(
                                          padding: EdgeInsets.all(10),
                                        );
                                      },),
                                  ),
                                  ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return const Divider(
                                          color: Colors.white30,
                                          thickness: 2,
                                          indent: 10,
                                        );
                                      },
                                      itemCount: 7,
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        DateTime _dailyDate = dateTime.add(Duration(days: index+1));
                                        String _fDailyDate = DateFormat('MMMMEEEEd').format(_dailyDate);
                                        return Container(
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(_fDailyDate,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13),),
                                              Container(
                                                  padding: const EdgeInsets.all(
                                                      10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceAround,
                                                    children: [
                                                      SizedBox(
                                                        width: _screenSize
                                                            .width *
                                                            0.1,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            const Text("Wind",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 11),),
                                                            Text( weathersModel.dailyWeather![index].windSpeed!.toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 13),)
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 30,
                                                        width: 1,
                                                        decoration: const BoxDecoration(
                                                          // border: Border.all(color: Colors.white),
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: _screenSize
                                                            .width *
                                                            0.1,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .center,
                                                          children:  [
                                                            const Text("Min. Temp",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 11),textAlign: TextAlign.center,),
                                                            Text(weathersModel.dailyWeather![index].minTemp!.toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 11),)
                                                          ],
                                                        ),
                                                      ),

                                                      Container(
                                                        height: 30,
                                                        width: 1,
                                                        decoration: const BoxDecoration(
                                                          // border: Border.all(color: Colors.white),
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: _screenSize
                                                            .width *
                                                            0.1,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            const Text("Max. Temp",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 11),textAlign: TextAlign.center,),
                                                            Text(weathersModel.dailyWeather![index].maxTemp!.toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 11),)
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 30,
                                                        width: 1,
                                                        decoration: const BoxDecoration(
                                                          // border: Border.all(color: Colors.white),
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: _screenSize
                                                            .width *
                                                            0.1,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            const Text("Humid.",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 11),),
                                                            Text(weathersModel.dailyWeather![index].humidity.toString() + " % ",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 11),)
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        );
                                      })
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
            }
            return const Center(child: CircularProgressIndicator(),);
          }
        );
      }
    );
  }
}
