import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:system_info2/system_info2.dart';

//Widgets
import '../widgets/card_titles_widget.dart';

class ProcessorWidget extends StatefulWidget {
  @override
  State<ProcessorWidget> createState() => _ProcessorWidgetState();
}

class _ProcessorWidgetState extends State<ProcessorWidget> {
  String processorVendor = '';
  String processorName = '';
  String processorCores = '';
  String processorArchitecture = '';
  String processorSoket = '';

  @override
  void initState() {
    super.initState();
    setVendor();
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

  final List<String> _processorsBrand = [
    'qualcomm',
    'exynos',
    'mediatek',
    'unisoc',
    'kirin',
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
                  processorVendor.toLowerCase() == _processorsBrand[0]
                      ? 'assets/processors/qualcomm.png'
                      : processorVendor.toLowerCase() == _processorsBrand[1]
                          ? 'assets/processors/exynos.png'
                          : processorVendor.toLowerCase() == _processorsBrand[2]
                              ? 'assets/processors/mediatek.png'
                              : processorVendor.toLowerCase() ==
                                      _processorsBrand[3]
                                  ? 'assets/processors/unisoc.png'
                                  : processorVendor.toLowerCase() ==
                                          _processorsBrand[4]
                                      ? 'assets/processors/kirin.png'
                                      : 'assets/noimage.png',
                  height: 100,
                  width: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    processorWidget(
                        processorVendor, EneftyIcons.crown_2_outline, true),
                    myDivider(mediaQuery),
                    processorWidget(
                        processorName, EneftyIcons.cpu_outline, false),
                    processorWidget(processorArchitecture,
                        EneftyIcons.layer_outline, false),
                    processorWidget('$processorCores cores',
                        EneftyIcons.cpu_setting_outline, false),
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

  Widget processorWidget(String title, IconData icon, bool titleON) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 16,
        ),
        CardTitlesWidget(
          title: title,
          isTitle: titleON,
        ),
      ],
    );
  }
}
