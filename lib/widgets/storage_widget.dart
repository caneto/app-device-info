import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:storage_info/storage_info.dart';

//Widgets
import '../widgets/card_titles_widget.dart';

class StorageWidget extends StatefulWidget {
  @override
  State<StorageWidget> createState() => _StorageWidgetState();
}

class _StorageWidgetState extends State<StorageWidget> {
  static int GIGAGABYTE = 1024 * 1024 * 1024;
  String storagePercentUsed = '';
  int freeStorageInGB = 0;
  int totalStorageInGB = 0;
  double indicatorPercent = 0;

  @override
  void initState() {
    super.initState();
    calculateRamPercent();
  }

  void calculateRamPercent() async {
    var _totalStorage = await StorageInfo.getStorageTotalSpace;
    var _freeStorage = await StorageInfo.getStorageFreeSpace;
    var _percentStepOne = (_freeStorage / _totalStorage) * 100;
    var _percentStepTwo = 100 - _percentStepOne;

    setState(() {
      storagePercentUsed = _percentStepTwo.toStringAsFixed(0).toString();
      indicatorPercent = _percentStepTwo / 100;

      freeStorageInGB = _freeStorage;
      totalStorageInGB = _totalStorage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;
    const sizedBox = SizedBox(height: 5);
    return Container(
      width: mediaQuery,
      child: Card(
        color: Colors.white24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 5),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Image.asset(
                      'assets/hard_drive.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardTitlesWidget(
                          title: 'Internal Storage', isTitle: true),
                      sizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LinearPercentIndicator(
                            lineHeight: 6,
                            width: mediaQuery - 150,
                            percent: indicatorPercent,
                            animation: true,
                            animationDuration: 2500,
                            progressColor: Colors.white,
                            backgroundColor: Colors.black12,
                            barRadius: const Radius.circular(16),
                          ),
                          Text(
                            '$storagePercentUsed%',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ],
                      ),
                      sizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          cardSubtitles(
                            'Total: ${(totalStorageInGB ~/ GIGAGABYTE)} GB, \t\tFree: ${(freeStorageInGB ~/ GIGAGABYTE)} GB',
                            mediaQuery,
                          ),
                        ],
                      ),
                    ],
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

  Widget cardSubtitles(String title, var mediaQuery) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: mediaQuery - 180,
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
        ),
      ),
    );
  }
}
