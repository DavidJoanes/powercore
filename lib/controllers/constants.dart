import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'timer_manager.dart';

final userInfo = GetStorage();

class Constants extends GetxController {
  // App version
  String appVersion = "1.03";
  // Colors
  Map<int, Color> defaultColor = {
    50: const Color(0xFFE8F5E9),
    100: const Color(0xFFC8E6C9),
    200: const Color(0xFFA5D6A7),
    300: const Color(0xFF81C784),
    400: const Color(0xFF66BB6A),
    500: Colors.green,
    600: const Color(0xFF43A047),
    700: const Color(0xFF388E3C),
    800: const Color(0xFF2E7D32),
    900: const Color(0xFF1B5E20),
  };

  late ValueNotifier<Duration> durationNotifier =
      ValueNotifier<Duration>(TimerManager().duration);
  late int tempTimer = 0;
  var primaryColor = const Color(0xff01937c);
  var whiteColor = Colors.white;
  var whiteColor2 = const Color.fromARGB(133, 248, 248, 248);
  var greyColor = Colors.grey;
  var greyColor2 = const Color.fromARGB(255, 234, 234, 234);
  var blackColor = Colors.black;
  var blackColor2 = const Color.fromARGB(255, 48, 48, 48);
  var successColor = Colors.greenAccent;
  var errorColor = Colors.redAccent;
  var transparentColor = Colors.transparent;
  var onboardColor01 = const Color(0xffd5ffd3);
  var onboardColor02 = const Color(0xfffef6ec);
  var onboardColor03 = const Color(0xFFE8E4FF);

  // temporal values
  late String tempResetPasscode;
  late String fName = userInfo.read("firstName") ?? "__";
  late String lName = userInfo.read("lastName") ?? "__";
  late String phone = "+234";
  late String address = "";
  // late String phone = userInfo.read("phoneNumber") ?? "+2349012345678";
  final double currentPower = 26.44;
}
