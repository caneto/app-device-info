import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';

//Widget
import '../widgets/card_titles_widget.dart';

class SystemWidget extends StatefulWidget {
  @override
  State<SystemWidget> createState() => _SystemWidgetState();
}

class _SystemWidgetState extends State<SystemWidget> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;
    return Container(
      width: mediaQuery,
      child: Card(
        color: Colors.white24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          child: Column(
            children: [
              const SizedBox(height: 5),
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.green,
                    child: Text(
                      _deviceData['version.release'].toString(),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                          fontSize: 44,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        androidVersionWidget(
                          'Android ${_deviceData['version.release'].toString()}',
                          Icons.android_outlined,
                          true,
                        ),
                        myDivider(mediaQuery),
                        androidVersionWidget(
                          'API Level ${_deviceData['version.sdkInt'].toString()}',
                          Icons.code_rounded,
                          false,
                        ),
                        androidVersionWidget(
                          'Release: ${_deviceData['version.securityPatch'].toString()}',
                          Icons.date_range_outlined,
                          false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget myDivider(var mediaQuery) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Container(
        height: 2,
        width: mediaQuery - 155,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.lightGreen, width: 1.0),
          ),
        ),
      ),
    );
  }

  Widget androidVersionWidget(String title, IconData icon, bool titleON) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
          CardTitlesWidget(
            title: title,
            isTitle: titleON,
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.release': build.version.release,
      'version.sdkInt': build.version.sdkInt,
      'version.securityPatch': build.version.securityPatch,
    };
  }
}
