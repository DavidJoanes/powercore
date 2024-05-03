import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:powercore/screens/login/login01.dart';
import 'package:powercore/screens/login/login02.dart';
import 'package:powercore/screens/onboarding/onboarding.dart';

import 'controllers/constants.dart';

final constantValues = Get.find<Constants>();

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  State<CustomSplashScreen> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen>
    with SingleTickerProviderStateMixin {
  final userInfo = GetStorage();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    userInfo.writeIfNull("firstName", "");
    userInfo.writeIfNull("lastName", "");
    userInfo.read("isNewUser")
        ? Future.delayed(const Duration(seconds: 5), () {
            Get.off(const CustomOnboarding());
          })
        : userInfo.read("powercellID") != ""
            ? Future.delayed(const Duration(seconds: 3), () {
                Get.off(const EnterOtpForLogin());
              })
            : Future.delayed(const Duration(seconds: 3), () {
                Get.off(const Login());
              });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: constantValues.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Container(
              height: size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/logo2.png"))),
            ),
          ),
        ],
      ),
    );
  }
}
