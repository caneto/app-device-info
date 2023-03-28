import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';

//Widgets
import '../widgets/ram_widget.dart';
import '../widgets/processor_widget.dart';
import '../widgets/home_title_widget.dart';
import '../widgets/storage_widget.dart';
import '../widgets/battery_widget.dart';
import '../widgets/system_widget.dart';
import '../widgets/device_widget.dart';

//Screens
import '../screens/device_info_screen.dart';
import '../screens/cpu_info_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            const Icon(EneftyIcons.a_3_square_outline),
            const SizedBox(width: 10),
            Text(
              'Device Information',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              HomeTitleWidget(title: 'RAM'),
              RamWidget(),
              HomeTitleWidget(title: 'Device'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(DeviceInfoScreen.routeName);
                },
                child: DeviceWidget(),
              ),
              HomeTitleWidget(title: 'CPU'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(CpuInfoScreen.routeName);
                },
                child: ProcessorWidget(),
              ),
              HomeTitleWidget(title: 'System'),
              SystemWidget(),
              HomeTitleWidget(title: 'Stats'),
              StorageWidget(),
              BatteryWidget(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
