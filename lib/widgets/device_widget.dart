import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:storage_info/storage_info.dart';
import 'package:system_info2/system_info2.dart';

//Widgets
import '../widgets/card_titles_widget.dart';

class DeviceWidget extends StatefulWidget {
  @override
  State<DeviceWidget> createState() => _DeviceWidgetState();
}

class _DeviceWidgetState extends State<DeviceWidget> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  static int GIGABYTE = 1024 * 1024 * 1024;

  String processorVendor = '';
  String processorName = '';
  String processorCores = '';
  String processorArchitecture = '';
  String processorSoket = '';
  String ramPercent = '';
  int usedRam = 0;
  double indicatorPercent = 0;
  int totalStorageInGB = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    calculateRamAndStorage();
    setVendor();
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

  final List<String> _brands = const [
    'oneplus',
    'samsung',
    'asus',
    'lg',
    'motorola',
  ];

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
        child: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              children: [
                Image.asset(
                  _deviceData['brand'].toLowerCase() == _brands[0]
                      ? 'assets/logos/oneplus.png'
                      : _deviceData['brand'].toLowerCase() == _brands[1]
                          ? 'assets/logos/samsung.png'
                          : _deviceData['brand'].toLowerCase() == _brands[2]
                              ? 'assets/logos/asus.png'
                              : _deviceData['brand'].toLowerCase() == _brands[3]
                                  ? 'assets/logos/lg.png'
                                  : _deviceData['brand'].toLowerCase() ==
                                          _brands[4]
                                      ? 'assets/logos/motorola.png'
                                      : 'assets/noimage.png',
                  height: 100,
                  width: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoWidget(
                      _deviceData['product'],
                      Icons.phone_android_sharp,
                      true,
                    ),
                    myDivider(mediaQuery),
                    infoWidget(
                      'Processor:  $processorCores cores processor',
                      Icons.memory_sharp,
                      false,
                    ),
                    infoWidget(
                      'RAM:  ${SysInfo.getTotalPhysicalMemory() ~/ GIGABYTE} GB',
                      Icons.memory_sharp,
                      false,
                    ),
                    infoWidget(
                      'Storage:  ${totalStorageInGB ~/ GIGABYTE} GB',
                      Icons.storage_sharp,
                      false,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  void setVendor() async {
    final processors = SysInfo.cores;

    for (var processor in processors) {
      setState(() {
        processorVendor = processor.vendor.toString();
        processorName = processor.name.toString();
        processorArchitecture = processor.architecture.toString();
        processorSoket = processor.socket.toString();
        processorCores = processors.length.toString();
      });
    }
  }

  void calculateRamAndStorage() async {
    var _totalRam = SysInfo.getTotalPhysicalMemory();
    var _freeRam = SysInfo.getFreeVirtualMemory();
    var _percentStepOne = (_freeRam / _totalRam) * 100;
    var _percentStepTwo = 100 - _percentStepOne;

    var _totalStorage = await StorageInfo.getStorageTotalSpace;
    setState(() {
      ramPercent = _percentStepTwo.toStringAsFixed(0).toString();
      indicatorPercent = _percentStepTwo / 100;
      usedRam = _totalRam - _freeRam;
      totalStorageInGB = _totalStorage;
    });
  }

  Widget myDivider(var mediaQuery) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
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

  Widget infoWidget(String title, IconData icon, bool titleON) {
    return Row(
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
    );
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo androidInfo) {

    var _androidInfo = androidInfo;
    
    return <String, dynamic>{
      'brand': _androidInfo.brand,
      'product': _androidInfo.product,
    };
  }
}
