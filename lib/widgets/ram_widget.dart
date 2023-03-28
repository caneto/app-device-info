import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:system_info2/system_info2.dart';

class RamWidget extends StatefulWidget {
  @override
  State<RamWidget> createState() => _RamWidgetState();
}

class _RamWidgetState extends State<RamWidget> {
  static int MEGABYTE = 1024 * 1024;
  String ramPercent = '';
  int usedRam = 0;
  double indicatorPercent = 0;

  @override
  void initState() {
    super.initState();
    calculateRamPercent();
  }

  void calculateRamPercent() {
    var _totalRam = SysInfo.getTotalPhysicalMemory();
    var _freeRam = SysInfo.getFreeVirtualMemory();
    var _percentStepOne = (_freeRam / _totalRam) * 100;
    var _percentStepTwo = 100 - _percentStepOne;
    setState(() {
      ramPercent = _percentStepTwo.toStringAsFixed(0).toString();
      indicatorPercent = _percentStepTwo / 100;
      usedRam = _totalRam - _freeRam;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;
    return Container(
      width: mediaQuery,
      child: Card(
        color: Colors.lightGreenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  CircularPercentIndicator(
                    radius: 40,
                    percent: indicatorPercent,
                    progressColor: Colors.white,
                    backgroundColor: Colors.black12,
                    circularStrokeCap: CircularStrokeCap.round,
                    animation: true,
                    animationDuration: 3500,
                    lineWidth: 5,
                    center: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ramPercent,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontSize: 26,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Text(
                            '%',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 100,
                    width: mediaQuery - 155,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LineChart(
                        LineChartData(
                          minX: 0,
                          maxX: 7,
                          minY: 0,
                          maxY: 2,
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                const FlSpot(0, 0),
                                FlSpot(1, indicatorPercent - 0.4),
                                FlSpot(2, indicatorPercent - 0.2),
                                FlSpot(3, indicatorPercent + 0.2),
                                FlSpot(5, indicatorPercent + 0.4),
                                FlSpot(7, indicatorPercent + 1),
                              ],
                              isCurved: true,
                              color: Colors.white,
                              dotData: FlDotData(
                                show: false,
                              ),
                            ),
                          ],
                          titlesData: FlTitlesData(
                            show: false,
                          ),
                          gridData: FlGridData(
                            show: true,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: Colors.amber,
                                strokeWidth: 1.5,
                              );
                            },
                            drawVerticalLine: true,
                            drawHorizontalLine: true,
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomData('Total RAM',
                      '${SysInfo.getTotalPhysicalMemory() ~/ MEGABYTE} MB'),
                  bottomData('Used RAM', '${usedRam ~/ MEGABYTE} MB'),
                  bottomData('Free RAM',
                      '${SysInfo.getFreeVirtualMemory() ~/ MEGABYTE} MB'),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomData(String title, String ramData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black,
              ),
        ),
        Row(
          children: [
            const Icon(EneftyIcons.a_3d_cube_bold,
                color: Colors.black, size: 18),
            const SizedBox(width: 2),
            Text(
              ramData,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
