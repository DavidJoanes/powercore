import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
          child: Column(
            children: [
              buildBattery(
                  size: size,
                  title: "Battery",
                  status: "Full",
                  voltage: 12,
                  batteryColor: constantValues.successColor,
                  batteryLevel: 100,
                  timeToFull: "00:00:00"),
              SizedBox(
                height: size.height * 0.04,
              ),
              buildPowerCell(
                  size: size,
                  title: "Powercell",
                  power: 12.20,
                  energyConsumption: 6.4),
              SizedBox(
                height: size.height * 0.04,
              ),
              buildSolarPanel(
                  size: size,
                  title: "Solar Panel",
                  energyProduced: 100,
                  voltage: 6.4,
                  current: 6.4,
                  health: "Excellent"),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBattery(
      {required var size,
      required String title,
      required String status,
      required double voltage,
      required Color batteryColor,
      required int batteryLevel,
      required String timeToFull}) {
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.95,
          child: ListTile(
            leading: Text(
              title,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.04)),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                // Status
                SizedBox(
                  width: size.width * 0.45,
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          child: ListTile(
                            leading: Icon(
                              CupertinoIcons.chart_bar_alt_fill,
                              color: constantValues.errorColor,
                            ),
                            title: Text(
                              "Status",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 12)),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text(
                            status,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.05)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // Voltage
                SizedBox(
                  width: size.width * 0.45,
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text(
                            "V",
                            style: TextStyle(
                                color: constantValues.successColor,
                                fontSize: 22),
                          ),
                          title: Text(
                            "Voltage",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 12)),
                          ),
                        ),
                        ListTile(
                          leading: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: "$voltage",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: userInfo.read("isDarkTheme")
                                              ? constantValues.whiteColor
                                              : constantValues.blackColor2,
                                          fontWeight: FontWeight.w600,
                                          fontSize: size.width * 0.06)),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "V",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: size.width * 0.04)),
                                    )
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Level
            Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                color: batteryLevel >= 99
                    ? constantValues.greyColor
                    : constantValues.whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                height: batteryLevel >= 99
                      ? size.height * 0.3
                      : batteryLevel >= 80
                          ? size.height * 0.26
                          : batteryLevel >= 60
                              ? size.height * 0.22
                              : batteryLevel >= 30
                                  ? size.height * 0.18
                                  : batteryLevel >= 10
                                      ? size.height * 0.14
                                      : size.height * 0.1,
                decoration: BoxDecoration(
                  color: batteryLevel >= 99
                      ? constantValues.successColor
                      : batteryLevel >= 80
                          ? const Color.fromARGB(255, 172, 224, 113)
                          : batteryLevel >= 60
                              ? Colors.lightGreenAccent
                              : batteryLevel >= 30
                                  ? Colors.amberAccent
                                  : batteryLevel >= 10
                                      ? constantValues.errorColor
                                      : const Color(0xffc62828),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: size.width * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.2,
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.battery_charging,
                            color: constantValues.greyColor,
                          ),
                          Text(
                            "Level",
                            style: GoogleFonts.poppins(
                                textStyle:
                                    TextStyle(color: constantValues.greyColor)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "$batteryLevel",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: constantValues.blackColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: size.width * 0.08)),
                            children: <TextSpan>[
                              TextSpan(
                                text: "%",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: constantValues.blackColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: size.width * 0.04)),
                              )
                            ])),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: Column(
                        children: [
                          Text(
                            timeToFull,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: constantValues.blackColor,
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                          Text(
                            "Time to Full",
                            style: GoogleFonts.poppins(
                                textStyle:
                                    TextStyle(color: constantValues.greyColor)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildPowerCell({
    required var size,
    required String title,
    required double power,
    required double energyConsumption,
  }) {
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.95,
          child: ListTile(
            leading: Text(
              title,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.04)),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Power
            SizedBox(
              width: size.width * 0.45,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.battery_charging_full_rounded,
                        color: constantValues.successColor,
                      ),
                      title: Text(
                        "Power",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 12)),
                      ),
                    ),
                    ListTile(
                      leading: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "$power",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: userInfo.read("isDarkTheme")
                                          ? constantValues.whiteColor
                                          : constantValues.blackColor2,
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.width * 0.06)),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "kW",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: size.width * 0.04)),
                                )
                              ])),
                    ),
                  ],
                ),
              ),
            ),
            // Energy consumption
            SizedBox(
              width: size.width * 0.45,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.settings_input_hdmi_outlined,
                        color: Colors.orange,
                      ),
                      title: Text(
                        "Energy Consumption",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 12)),
                      ),
                    ),
                    ListTile(
                      leading: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "$energyConsumption",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: userInfo.read("isDarkTheme")
                                          ? constantValues.whiteColor
                                          : constantValues.blackColor2,
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.width * 0.06)),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "kWh",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: size.width * 0.04)),
                                )
                              ])),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildSolarPanel({
    required var size,
    required String title,
    required double energyProduced,
    required double voltage,
    required double current,
    required String health,
  }) {
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.95,
          child: ListTile(
            leading: Text(
              title,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.04)),
            ),
          ),
        ),
        // Row 1
        SizedBox(
          width: size.width * 0.92,
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: size.width * 0.3,
                    child: Column(
                      children: [
                        const Icon(
                          Icons.light_mode_outlined,
                          color: Colors.orange,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Energy Produced",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: constantValues.greyColor,
                                  fontSize: 12)),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: "$energyProduced",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: userInfo.read("isDarkTheme")
                                            ? constantValues.whiteColor
                                            : constantValues.blackColor2,
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.width * 0.08)),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "kWh",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: size.width * 0.04)),
                                  )
                                ])),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        // Row 2
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: size.width * 0.45,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(
                        "V",
                        style: TextStyle(
                            color: constantValues.successColor, fontSize: 22),
                      ),
                      title: Text(
                        "Voltage",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 12)),
                      ),
                    ),
                    ListTile(
                      leading: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "$voltage",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: userInfo.read("isDarkTheme")
                                          ? constantValues.whiteColor
                                          : constantValues.blackColor2,
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.width * 0.06)),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "V",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: size.width * 0.04)),
                                )
                              ])),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.45,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Text(
                        "A",
                        style: TextStyle(fontSize: 22),
                      ),
                      title: Text(
                        "Current",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 12)),
                      ),
                    ),
                    ListTile(
                      leading: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "$current",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: userInfo.read("isDarkTheme")
                                          ? constantValues.whiteColor
                                          : constantValues.blackColor2,
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.width * 0.06)),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "kWh",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: size.width * 0.04)),
                                )
                              ])),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        // Row 3
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: size.width * 0.45,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.health_and_safety_outlined,
                        color: constantValues.errorColor,
                      ),
                      title: Text(
                        "Health",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 12)),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        health,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.04)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.45,
            )
          ],
        ),
      ],
    );
  }
}
