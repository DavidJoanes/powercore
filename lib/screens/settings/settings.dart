import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controllers/constants.dart';
import '../../controllers/theme_controller.dart';
import 'alerts_and_reminders.dart';
import 'change_passcode.dart';
import 'change_passcode_.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    final fontStyle1a = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w600));
    final fontStyle1b = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w600, fontSize: size.width * 0.04));
    final fontStyle1c = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w400));
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
          "Settings",
          style: fontStyle1a,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  buildCustomWidget(
                    noOfTiles: 1,
                    size: size,
                    font1: fontStyle1b,
                    font2: fontStyle1c,
                    heading: "Account Settings",
                    title: "Change Passcode",
                    icon: const Icon(
                      CupertinoIcons.forward,
                    ),
                    onTap: () {
                      Get.to(userInfo.read("passCode") != ""
                          ? const ChangePasscode()
                          : const ChangePasscode_());
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  buildCustomWidget(
                    noOfTiles: 1,
                    size: size,
                    font1: fontStyle1b,
                    font2: fontStyle1c,
                    heading: "Power Limit",
                    title: "Daily Power Warning and Limit",
                    icon: const Icon(
                      CupertinoIcons.forward,
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  buildCustomWidget(
                    noOfTiles: 1,
                    size: size,
                    font1: fontStyle1b,
                    font2: fontStyle1c,
                    heading: "Appearance",
                    title: "Dark Mode",
                    icon: IconButton(
                        tooltip: userInfo.read("isDarkTheme")
                            ? "Turn on"
                            : "Turn off",
                        onPressed: () {
                          setState(() {
                            userInfo.write(
                                "isDarkTheme", !userInfo.read("isDarkTheme"));
                            themeChanger.setTheme(userInfo.read("isDarkTheme")
                                ? ThemeData.dark()
                                : ThemeData(
                                    primarySwatch: MaterialColor(0xFF4CAF50,
                                        constantValues.defaultColor),
                                    brightness: Brightness.light));
                          });
                          // setState(() {
                          //   Get.changeTheme(userInfo.read("isDarkTheme")
                          //       ? ThemeData.light()
                          //       : ThemeData.dark());
                          // });},
                        },
                        icon: userInfo.read("isDarkTheme")
                            ? Icon(
                                Icons.toggle_on_rounded,
                                color: constantValues.primaryColor,
                                size: 40,
                              )
                            : Icon(
                                Icons.toggle_off_rounded,
                                color: constantValues.greyColor,
                                size: 40,
                              )),
                    onTap: () {
                      setState(() {
                        userInfo.write(
                            "isDarkTheme", !userInfo.read("isDarkTheme"));
                        themeChanger.setTheme(userInfo.read("isDarkTheme")
                            ? ThemeData.dark()
                            : ThemeData(
                                primarySwatch: MaterialColor(
                                    0xFF4CAF50, constantValues.defaultColor),
                                brightness: Brightness.light));
                      });
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  buildCustomWidget(
                    noOfTiles: 2,
                    size: size,
                    font1: fontStyle1b,
                    font2: fontStyle1c,
                    heading: "Notification",
                    title: "Alerts and Reminders",
                    title2: "Email Preferences",
                    icon: const Icon(
                      CupertinoIcons.forward,
                    ),
                    onTap: () {
                      Get.to(const AlertsAndReminders());
                    },
                    onTap2: () {},
                  ),
                SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomWidget({
    required int noOfTiles,
    required var size,
    required TextStyle font1,
    required TextStyle font2,
    required String heading,
    required String title,
    String? title2,
    required Widget icon,
    required Function onTap,
    Function? onTap2,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width,
          child: ListTile(
            leading: Text(
              heading,
              style: font1,
            ),
          ),
        ),
        Card(
          shape: Border.all(width: 1, color: constantValues.blackColor2),
          child: SizedBox(
            width: size.width * 0.9,
            child: ListTile(
              title: Text(
                title,
                style: font2,
              ),
              trailing: icon,
              onTap: () => onTap(),
            ),
          ),
        ),
        noOfTiles > 1
            ? Card(
                shape: Border.all(width: 1, color: constantValues.blackColor2),
                child: SizedBox(
                  width: size.width * 0.9,
                  child: ListTile(
                    title: Text(
                      title2!,
                      style: font2,
                    ),
                    trailing: icon,
                    onTap: () => onTap2!(),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
