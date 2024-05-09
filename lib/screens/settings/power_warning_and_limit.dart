import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/constants.dart';

class PowerWarningAndLimit extends StatefulWidget {
  const PowerWarningAndLimit({super.key});

  @override
  State<PowerWarningAndLimit> createState() => _PowerWarningAndLimitState();
}

class _PowerWarningAndLimitState extends State<PowerWarningAndLimit> {
  final constantValues = Get.find<Constants>();
  final userInfo = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fontStyle1 = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w500));
    final fontStyle1a = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w600, fontSize: size.width * 0.04));
    final fontStyle1b = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w500));
    final fontStyle1c = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w300));
    final fontStyle1d = GoogleFonts.poppins(
        textStyle:
            const TextStyle(fontWeight: FontWeight.w400, color: Colors.amber));
    final fontStyle1e = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w400, color: constantValues.errorColor));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Power Warning and Limit",
          style: fontStyle1,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "POWER WARNING",
                  style: fontStyle1a,
                ),
              ),
              Card(
                child: Column(
                  children: [
                    buildCustomWidget(
                      size: size,
                      font1: fontStyle1b,
                      font2: fontStyle1c,
                      title: "Set Daily Power Warning",
                      subtitle:
                          "Get notified when you are approaching your daily power limit.",
                      icon: IconButton(
                        onPressed: () {
                          setState(() {
                            userInfo.write(
                              "powerWarningAndLimit",
                              {
                                "warning": !userInfo
                                    .read("powerWarningAndLimit")["warning"],
                                "limit": userInfo
                                    .read("powerWarningAndLimit")["limit"],
                                "warningValue": userInfo.read(
                                    "powerWarningAndLimit")["warningValue"],
                                "limitValue": userInfo
                                    .read("powerWarningAndLimit")["limitValue"],
                              },
                            );
                          });
                        },
                        icon: userInfo.read("powerWarningAndLimit")["warning"]
                            ? Icon(
                                Icons.toggle_on_rounded,
                                color: constantValues.primaryColor,
                                size: 40,
                              )
                            : Icon(
                                Icons.toggle_off_rounded,
                                color: constantValues.greyColor,
                                size: 40,
                              ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: const Divider(),
                    ),
                    buildCustomWidget(
                      size: size,
                      font1: fontStyle1b,
                      font2: fontStyle1d,
                      title: "Power Warning",
                      subtitle:
                          "${userInfo.read("powerWarningAndLimit")["warningValue"]}kWh",
                      icon: IconButton(
                          onPressed: () {
                            if (userInfo
                                .read("powerWarningAndLimit")["warning"]) {}
                          },
                          icon: const Icon(
                            CupertinoIcons.forward,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "POWER LIMIT",
                  style: fontStyle1a,
                ),
              ),
              Card(
                child: Column(
                  children: [
                    buildCustomWidget(
                      size: size,
                      font1: fontStyle1b,
                      font2: fontStyle1c,
                      title: "Set Daily Power Limit",
                      subtitle:
                          "Set a data limit for optimal control and awareness of your energy consumption.",
                      icon: IconButton(
                        onPressed: () {
                          setState(() {
                            userInfo.write(
                              "powerWarningAndLimit",
                              {
                                "warning": userInfo
                                    .read("powerWarningAndLimit")["warning"],
                                "limit": !userInfo
                                    .read("powerWarningAndLimit")["limit"],
                                "warningValue": userInfo.read(
                                    "powerWarningAndLimit")["warningValue"],
                                "limitValue": userInfo
                                    .read("powerWarningAndLimit")["limitValue"],
                              },
                            );
                          });
                        },
                        icon: userInfo.read("powerWarningAndLimit")["limit"]
                            ? Icon(
                                Icons.toggle_on_rounded,
                                color: constantValues.primaryColor,
                                size: 40,
                              )
                            : Icon(
                                Icons.toggle_off_rounded,
                                color: constantValues.greyColor,
                                size: 40,
                              ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: const Divider(),
                    ),
                    buildCustomWidget(
                      size: size,
                      font1: fontStyle1b,
                      font2: fontStyle1e,
                      title: "Power Limit",
                      subtitle:
                          "${userInfo.read("powerWarningAndLimit")["limitValue"]}kWh",
                      icon: IconButton(
                          onPressed: () {
                            if (userInfo
                                .read("powerWarningAndLimit")["limit"]) {}
                          },
                          icon: const Icon(
                            CupertinoIcons.forward,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget buildCustomWidget({
    required var size,
    required TextStyle font1,
    required TextStyle font2,
    required String title,
    required String subtitle,
    required Widget icon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: SizedBox(
        width: size.width,
        child: ListTile(
          title: Text(
            title,
            style: font1,
          ),
          subtitle: Text(
            subtitle,
            style: font2,
          ),
          trailing: icon,
        ),
      ),
    );
  }
}
