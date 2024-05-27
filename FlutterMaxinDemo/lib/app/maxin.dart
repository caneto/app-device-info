import 'dart:async';

import 'package:flutter/material.dart';
import 'package:log_print/log_print.dart';

mixin TimerMixin {
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';
  List<int> timerData = [];

  startTimer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      timerData.clear();
      timerData.add(timer.tick.toInt());
    });

    LogPrint("$hoursStr:$minutesStr:$secondsStr", messageColor: Colors.blue, type: LogPrintType.info);

    return timerData;
  }

  void disposeTimer() {
    hoursStr =
        ((timerData[0] / (60 * 60)) % 60).floor().toString().padLeft(2, "0");

    minutesStr = ((timerData[0] / 60) % 60).floor().toString().padLeft(2, "0");
    secondsStr = (timerData[0] % 60).floor().toString().padLeft(2, "0");
    
    LogPrint("$hoursStr:$minutesStr:$secondsStr", messageColor: Colors.white, type: LogPrintType.info);
   }
}
