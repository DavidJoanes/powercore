// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../controllers/constants.dart';
import '../controllers/theme_controller.dart';
import '../screens/profile/profile.dart';

class CustomNavDrawer extends StatefulWidget {
  CustomNavDrawer({super.key, required this.theme});
  late ThemeChanger theme;

  @override
  State<CustomNavDrawer> createState() => _CustomNavDrawerState();
}

class _CustomNavDrawerState extends State<CustomNavDrawer> {
  final constantValues = Get.find<Constants>();
  final userInfo = GetStorage();

  int ind = 0;
  List<String> eTips = [
    "Turn off appliances that consume much power.",
    "Ensure you compare your current energy consumption with the previous day.",
    "Always make sure your powercell stays plugged in to the mains except when full.",
  ];

  @override
  void initState() {
    setState(() {
      ind = Random().nextInt(3);
    });
    super.initState();
    userInfo.writeIfNull("firstName", "");
    userInfo.writeIfNull("lastName", "");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fontStyle1a = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w700));
    final fontStyle1b = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w500));
    return Drawer(
      elevation: 30,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02,
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              buildHeader(
                size,
                fontStyle1a,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Divider(
                thickness: 5,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              buildMenuItem(size, Icons.person_outlined, "Profile", fontStyle1b,
                  () {
                Get.to(const Profile());
              }),
              buildMenuItem(size, Icons.settings_outlined, "Settings",
                  fontStyle1b, () {}),
              buildMenuItem(size, CupertinoIcons.question_circle,
                  "Help & Support", fontStyle1b, () {}),
              buildMenuItem(size, Icons.privacy_tip_outlined, "Privacy",
                  fontStyle1b, () {}),
              buildMenuItem(
                  size, Icons.info_outline, "About", fontStyle1b, () {}),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Divider(
                thickness: 5,
              ),
              ListTile(
                leading: IconButton(
                    tooltip:
                        userInfo.read("isDarkTheme") ? "Turn on" : "Turn off",
                    onPressed: () {
                      setState(() {
                        userInfo.write(
                            "isDarkTheme", !userInfo.read("isDarkTheme"));
                        widget.theme.setTheme(userInfo.read("isDarkTheme")
                            ? ThemeData.dark()
                            : ThemeData(
                                primarySwatch: MaterialColor(
                                    0xFF4CAF50, constantValues.defaultColor),
                                brightness: Brightness.light));
                      });
                      // setState(() {
                      //   Get.changeTheme(userInfo.read("isDarkTheme")
                      //       ? ThemeData.light()
                      //       : ThemeData.dark());
                      // });},
                    },
                    icon: Icon(userInfo.read("isDarkTheme")
                        ? CupertinoIcons.lightbulb
                        : CupertinoIcons.lightbulb_fill)),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: buildTips(size, eTips[ind], () {}),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget buildHeader(Size size, TextStyle font) {
    return ListTile(
      leading: CircleAvatar(
        radius: size.width * 0.05,
        backgroundColor: constantValues.primaryColor,
        child: Text(
          constantValues.fName[0].toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w900, color: constantValues.whiteColor),
        ),
      ),
      title: Text(
        "${constantValues.fName.capitalizeFirst} ${constantValues.lName.capitalizeFirst}",
        style: font,
      ),
      subtitle: Text(
        userInfo.read("powercellID"),
        style: TextStyle(color: constantValues.primaryColor),
      ),
    );
  }

  Widget buildMenuItem(
      Size size, IconData icon, String title, TextStyle font, Function onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: font,
      ),
      onTap: () => onTap(),
    );
  }

  Widget buildTips(Size size, String subTitle, Function onTap) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 148, 253, 175),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          "Energy Efficiency Tips",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.w800, color: constantValues.blackColor2),
        ),
        subtitle: Text(
          subTitle,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: constantValues.blackColor2),
        ),
        trailing: IconButton(
          icon: Icon(
            IconlyBold.arrow_right_2,
            color: constantValues.blackColor2,
          ),
          onPressed: () => onTap(),
        ),
      ),
    );
  }
}
