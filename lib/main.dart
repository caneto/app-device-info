import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Screens
import './screens/home_page_screen.dart';
import './screens/device_info_screen.dart';
import './screens/cpu_info_screen.dart';

void main() => runApp(DeviceInfo());

class DeviceInfo extends StatefulWidget {
  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Device Info',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: HomePage(),
      routes: {
        DeviceInfoScreen.routeName: (ctx) => DeviceInfoScreen(),
        CpuInfoScreen.routeName: (ctx) => CpuInfoScreen(),
      },
    );
  }
}