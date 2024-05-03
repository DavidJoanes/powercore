import 'dart:async';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

final constantValues = Get.find<Constants>();

class TimerManager {
  late Duration duration = const Duration();
  Timer? timer;

  void addTime() {
    int addedSeconds = 1;
    late int seconds = duration.inSeconds + addedSeconds;
    duration = Duration(seconds: seconds);
    addedSeconds++;
    constantValues.durationNotifier.value = duration;
    constantValues.tempTimer = timer!.tick;
    // print("start: ${constantValues.tempTimer}");
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1),
        (_) => userInfo.read("pcState") ? addTime() : _.cancel());
  }

  void resetTimer() {
    duration = const Duration();
    timer?.cancel();
    constantValues.durationNotifier.value = duration;
    // print("stopped: ${constantValues.tempTimer}");
  }

  void dispose() {
    // timer?.cancel();
    // _durationNotifier.dispose();
  }
}
