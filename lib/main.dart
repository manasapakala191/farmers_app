import 'package:farmers_app/home_screen.dart';
import 'package:farmers_app/models/locationModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}


final Map<int, Color> color =
{
  50:const Color(0xff519872).withOpacity(0.1),
  100: const Color(0xff519872).withOpacity(0.2),
  200: const Color(0xff519872).withOpacity(0.3),
  300: const Color(0xff519872).withOpacity(0.4),
  400: const Color(0xff519872).withOpacity(0.5),
  500: const Color(0xff519872).withOpacity(0.6),
  600: const Color(0xff519872).withOpacity(0.7),
  700: const Color(0xff519872).withOpacity(0.8),
  800: const Color(0xff519872).withOpacity(0.9),
  900: const Color(0xff519872).withOpacity(1),
};
MaterialColor colorCustom = MaterialColor(0xFF519872, color);
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationProvider(latitude: 17.8, longitude: 73.3, area: "Maharashtra"))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

