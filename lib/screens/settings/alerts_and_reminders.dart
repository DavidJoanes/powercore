import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/constants.dart';

class AlertsAndReminders extends StatefulWidget {
  const AlertsAndReminders({super.key});

  @override
  State<AlertsAndReminders> createState() => _AlertsAndRemindersState();
}

class _AlertsAndRemindersState extends State<AlertsAndReminders> {
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
        textStyle: const TextStyle(fontWeight: FontWeight.w600));
    final fontStyle1b = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w300));
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
          "Alerts and Reminders",
          style: fontStyle1,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Card(
                  child: Column(
                    children: [
                      buildCustomWidget(
                        size: size,
                        font1: fontStyle1a,
                        font2: fontStyle1b,
                        title: "Battery Health Reminder",
                        subtitle:
                            "Regular reminder to ensure the optimal health of your Powercell battery.",
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              userInfo.write(
                                "alerts",
                                {
                                  "batteryHealth":
                                      !userInfo.read("alerts")["batteryHealth"],
                                  "lowCharge":
                                      userInfo.read("alerts")["lowCharge"],
                                  "powerOverload":
                                      userInfo.read("alerts")["powerOverload"],
                                  "energyUsageGoal":
                                      userInfo.read("alerts")["energyUsageGoal"],
                                  "energyUsageSummary": userInfo
                                      .read("alerts")["energyUsageSummary"],
                                  "solarPanelPerformance": userInfo
                                      .read("alerts")["solarPanelPerformance"],
                                  "energyEfficiencyTips": userInfo
                                      .read("alerts")["energyEfficiencyTips"],
                                  "appUpdate":
                                      userInfo.read("alerts")["appUpdate"],
                                },
                              );
                            });
                          },
                          icon: userInfo.read("alerts")["batteryHealth"]
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
                        font1: fontStyle1a,
                        font2: fontStyle1b,
                        title: "Low Powercell Charge Alert",
                        subtitle:
                            "Notifies you when your Powercell charge is low.",
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              userInfo.write(
                                "alerts",
                                {
                                  "batteryHealth":
                                      userInfo.read("alerts")["batteryHealth"],
                                  "lowCharge":
                                      !userInfo.read("alerts")["lowCharge"],
                                  "powerOverload":
                                      userInfo.read("alerts")["powerOverload"],
                                  "energyUsageGoal":
                                      userInfo.read("alerts")["energyUsageGoal"],
                                  "energyUsageSummary": userInfo
                                      .read("alerts")["energyUsageSummary"],
                                  "solarPanelPerformance": userInfo
                                      .read("alerts")["solarPanelPerformance"],
                                  "energyEfficiencyTips": userInfo
                                      .read("alerts")["energyEfficiencyTips"],
                                  "appUpdate":
                                      userInfo.read("alerts")["appUpdate"],
                                },
                              );
                            });
                          },
                          icon: userInfo.read("alerts")["lowCharge"]
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
                        font1: fontStyle1a,
                        font2: fontStyle1b,
                        title: "Power Overload Warning",
                        subtitle: "Alerts you about identified power oveload.",
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              userInfo.write(
                                "alerts",
                                {
                                  "batteryHealth":
                                      userInfo.read("alerts")["batteryHealth"],
                                  "lowCharge":
                                      userInfo.read("alerts")["lowCharge"],
                                  "powerOverload":
                                      !userInfo.read("alerts")["powerOverload"],
                                  "energyUsageGoal":
                                      userInfo.read("alerts")["energyUsageGoal"],
                                  "energyUsageSummary": userInfo
                                      .read("alerts")["energyUsageSummary"],
                                  "solarPanelPerformance": userInfo
                                      .read("alerts")["solarPanelPerformance"],
                                  "energyEfficiencyTips": userInfo
                                      .read("alerts")["energyEfficiencyTips"],
                                  "appUpdate":
                                      userInfo.read("alerts")["appUpdate"],
                                },
                              );
                            });
                          },
                          icon: userInfo.read("alerts")["powerOverload"]
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
                        font1: fontStyle1a,
                        font2: fontStyle1b,
                        title: "Energy Usage Goal Reminder",
                        subtitle:
                            "Notifies you when your power usage is approaching the set limit.",
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              userInfo.write(
                                "alerts",
                                {
                                  "batteryHealth":
                                      userInfo.read("alerts")["batteryHealth"],
                                  "lowCharge":
                                      userInfo.read("alerts")["lowCharge"],
                                  "powerOverload":
                                      userInfo.read("alerts")["powerOverload"],
                                  "energyUsageGoal":
                                      !userInfo.read("alerts")["energyUsageGoal"],
                                  "energyUsageSummary": userInfo
                                      .read("alerts")["energyUsageSummary"],
                                  "solarPanelPerformance": userInfo
                                      .read("alerts")["solarPanelPerformance"],
                                  "energyEfficiencyTips": userInfo
                                      .read("alerts")["energyEfficiencyTips"],
                                  "appUpdate":
                                      userInfo.read("alerts")["appUpdate"],
                                },
                              );
                            });
                          },
                          icon: userInfo.read("alerts")["energyUsageGoal"]
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
                        font1: fontStyle1a,
                        font2: fontStyle1b,
                        title: "Energy Usage Summary",
                        subtitle:
                            "Notifies you when your weekly energy summary is available.",
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              userInfo.write(
                                "alerts",
                                {
                                  "batteryHealth":
                                      userInfo.read("alerts")["batteryHealth"],
                                  "lowCharge":
                                      userInfo.read("alerts")["lowCharge"],
                                  "powerOverload":
                                      userInfo.read("alerts")["powerOverload"],
                                  "energyUsageGoal":
                                      userInfo.read("alerts")["energyUsageGoal"],
                                  "energyUsageSummary": !userInfo
                                      .read("alerts")["energyUsageSummary"],
                                  "solarPanelPerformance": userInfo
                                      .read("alerts")["solarPanelPerformance"],
                                  "energyEfficiencyTips": userInfo
                                      .read("alerts")["energyEfficiencyTips"],
                                  "appUpdate":
                                      userInfo.read("alerts")["appUpdate"],
                                },
                              );
                            });
                          },
                          icon: userInfo.read("alerts")["energyUsageSummary"]
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
                        font1: fontStyle1a,
                        font2: fontStyle1b,
                        title: "Solar Panel Performance Alert",
                        subtitle:
                            "Alerts you when your solar panels perform below average.",
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              userInfo.write(
                                "alerts",
                                {
                                  "batteryHealth":
                                      userInfo.read("alerts")["batteryHealth"],
                                  "lowCharge":
                                      userInfo.read("alerts")["lowCharge"],
                                  "powerOverload":
                                      userInfo.read("alerts")["powerOverload"],
                                  "energyUsageGoal":
                                      userInfo.read("alerts")["energyUsageGoal"],
                                  "energyUsageSummary": userInfo
                                      .read("alerts")["energyUsageSummary"],
                                  "solarPanelPerformance": !userInfo
                                      .read("alerts")["solarPanelPerformance"],
                                  "energyEfficiencyTips": userInfo
                                      .read("alerts")["energyEfficiencyTips"],
                                  "appUpdate":
                                      userInfo.read("alerts")["appUpdate"],
                                },
                              );
                            });
                          },
                          icon: userInfo.read("alerts")["solarPanelPerformance"]
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
                        font1: fontStyle1a,
                        font2: fontStyle1b,
                        title: "Energy Efficiency Tip",
                        subtitle: "Periodic tips on optimizing energy usage.",
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              userInfo.write(
                                "alerts",
                                {
                                  "batteryHealth":
                                      userInfo.read("alerts")["batteryHealth"],
                                  "lowCharge":
                                      userInfo.read("alerts")["lowCharge"],
                                  "powerOverload":
                                      userInfo.read("alerts")["powerOverload"],
                                  "energyUsageGoal":
                                      userInfo.read("alerts")["energyUsageGoal"],
                                  "energyUsageSummary": userInfo
                                      .read("alerts")["energyUsageSummary"],
                                  "solarPanelPerformance": userInfo
                                      .read("alerts")["solarPanelPerformance"],
                                  "energyEfficiencyTips": !userInfo
                                      .read("alerts")["energyEfficiencyTips"],
                                  "appUpdate":
                                      userInfo.read("alerts")["appUpdate"],
                                },
                              );
                            });
                          },
                          icon: userInfo.read("alerts")["energyEfficiencyTips"]
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
                        font1: fontStyle1a,
                        font2: fontStyle1b,
                        title: "App Update Notification",
                        subtitle:
                            "Informs you on the availability of a new update.",
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              userInfo.write(
                                "alerts",
                                {
                                  "batteryHealth":
                                      userInfo.read("alerts")["batteryHealth"],
                                  "lowCharge":
                                      userInfo.read("alerts")["lowCharge"],
                                  "powerOverload":
                                      userInfo.read("alerts")["powerOverload"],
                                  "energyUsageGoal":
                                      userInfo.read("alerts")["energyUsageGoal"],
                                  "energyUsageSummary": userInfo
                                      .read("alerts")["energyUsageSummary"],
                                  "solarPanelPerformance": userInfo
                                      .read("alerts")["solarPanelPerformance"],
                                  "energyEfficiencyTips": userInfo
                                      .read("alerts")["energyEfficiencyTips"],
                                  "appUpdate":
                                      !userInfo.read("alerts")["appUpdate"],
                                },
                              );
                            });
                          },
                          icon: userInfo.read("alerts")["appUpdate"]
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
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                )
              ],
            ),
          ),
        ),
      ),
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
