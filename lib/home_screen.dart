import 'package:farmers_app/models/locationModel.dart';
import 'package:farmers_app/tabs/newsTab.dart';
import 'package:farmers_app/tabs/weatherTab.dart';
import 'package:farmers_app/tabs/portalTab.dart';
import 'package:farmers_app/tabs/soilHealthTab.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIdx=0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }

  _tabBuilder(){
    switch(_selectedIdx){
      case 0:
        return const WeatherTab();
      case 1:
        return SoilHealthTab();
      case 2:
        return const PortalTab();
      case 3:
        return const NewsTab();
      default:
        return Container(child: const Text("No Such Tab",));
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Soil Card"),
          ),
          body: Center(
            child: _tabBuilder(),
          ),
          // drawer: Drawer(
          //   child: ListView(shrinkWrap: true,
          //     children: [
          //       DrawerHeader(
          //           decoration: const BoxDecoration(
          //             color: const Color(0xffE4C5AF),
          //           ),
          //           child: Center(child: Container(child: Column(
          //             children: const [
          //               Icon(Icons.account_circle_outlined,size: 40,),
          //               Text("Username",style: TextStyle(color: Colors.black54),),
          //             ],
          //           ),))),
          //       ListTile(
          //         contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          //         leading: const Icon(Icons.home),
          //         title: const Text("Home"),
          //         onTap: (){
          //
          //         },
          //       ),
          //       ListTile(
          //         contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
          //         leading: const Icon(Icons.location_city_outlined),
          //         title: const Text("Govt. Schemes"),
          //         onTap: (){
          //
          //         },
          //       ),
          //       ListTile(
          //         contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
          //         leading: const Icon(Icons.logout),
          //         title: const Text("Logout"),
          //         onTap: (){
          //
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.green,
            mini: true,
            shape: const CircleBorder(
              side: BorderSide(
                color: Colors.green
              )
              // BorderRadius.only(topLeft: BorderRadius.circular(100),topRight: BorderRadius.circular(100))
            ),
            elevation: 0,
            child: const Icon(Icons.location_on_sharp,size: 20,),
            tooltip: "Change location",
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: const Text("Change Location"),
                      content: Image.asset('assets/images/maharashtra_data.png',
                        height: _screenSize.height*0.25,
                        width: _screenSize.width*0.8,
                        fit: BoxFit.cover,
                      ),
                      actions: [
                        IconButton(
                            onPressed: () async {
                              Position _position =  await _determinePosition();
                              Provider.of<LocationProvider>(context,listen: false).updateLocation(_position);
                              Navigator.pop(context);
                            }, icon: Icon(Icons.my_location,size: 30,),
                          tooltip: "Read current location",
                    )

                      ],
                    );
                  }
              );
            },
          ),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: BottomNavigationBar(
              elevation: 10,
              type: BottomNavigationBarType.shifting,
              currentIndex: _selectedIdx,
              selectedItemColor: Colors.green,
              unselectedItemColor: const Color(0xff5C6784),
              onTap: _onItemTapped,
              // unselectedLabelStyle: TextStyle(color: Colors.black),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.cloud),
                    label: 'Weather'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bar_chart),
                    label: 'Soil Health'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.wb_twighlight),
                    label: 'Portal'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.article_outlined),
                    label: 'News'
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
