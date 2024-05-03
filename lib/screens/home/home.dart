// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:powercore/controllers/timer_manager.dart';

import '../../components/stacked_bar_chart.dart';
import '../../controllers/constants.dart';
import '../../controllers/custom_charts_data.dart' as chartmodel;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final constantValues = Get.find<Constants>();
  final userInfo = GetStorage();
  Color? tempPcStateColor;
  late TimerManager _timerManager;

  /// Create series list with multiple series
  static List<charts.Series<Ordinalpower, String>> _createSampleData() {
    final prevWeek = [
      Ordinalpower('Sun', Random().nextDouble() * 31),
      Ordinalpower('Mon', Random().nextDouble() * 31),
      Ordinalpower('Tue', Random().nextDouble() * 31),
      Ordinalpower('Wed', Random().nextDouble() * 31),
      Ordinalpower('Thu', Random().nextDouble() * 31),
      Ordinalpower('Fri', Random().nextDouble() * 31),
      Ordinalpower('Sat', Random().nextDouble() * 31),
    ];

    final currWeek = [
      Ordinalpower('Sun', Random().nextDouble() * 31),
      Ordinalpower('Mon', Random().nextDouble() * 31),
      Ordinalpower('Tue', Random().nextDouble() * 31),
      Ordinalpower('Wed', Random().nextDouble() * 31),
      Ordinalpower('Thu', Random().nextDouble() * 31),
      Ordinalpower('Fri', Random().nextDouble() * 31),
      Ordinalpower('Sat', Random().nextDouble() * 31),
    ];

    return [
      charts.Series<Ordinalpower, String>(
        id: 'previousWeek',
        domainFn: (Ordinalpower power, _) => power.day,
        measureFn: (Ordinalpower power, _) => power.power,
        data: prevWeek,
      ),
      charts.Series<Ordinalpower, String>(
        id: 'currentWeek',
        domainFn: (Ordinalpower power, _) => power.day,
        measureFn: (Ordinalpower power, _) => power.power,
        data: currWeek,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    userInfo.read("pcState")
        ? tempPcStateColor = constantValues.primaryColor
        : tempPcStateColor = constantValues.greyColor;
    _timerManager = TimerManager();
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final fontStyle1a = GoogleFonts.poppins(
    //     textStyle: TextStyle(
    //         fontWeight: FontWeight.w500, color: constantValues.greyColor));
    final fontStyle1b = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: size.width * 0.1,
            color: userInfo.read("isDarkTheme")
                ? userInfo.read("pcState")
                    ? constantValues.whiteColor
                    : constantValues.greyColor
                : userInfo.read("pcState")
                    ? constantValues.blackColor
                    : constantValues.greyColor));
    final fontStyle1c = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: size.width * 0.025,
            fontWeight: FontWeight.w500,
            color: userInfo.read("pcState")
                ? constantValues.primaryColor
                : constantValues.greyColor));
    final fontStyle1d1 = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: size.width * 0.045,
            fontWeight: FontWeight.w600,
            color: userInfo.read("pcState")
                ? constantValues.blackColor
                : constantValues.greyColor));
    final fontStyle1d2 = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: size.width * 0.045,
            fontWeight: FontWeight.w600,
            color: userInfo.read("pcState")
                ? constantValues.whiteColor
                : constantValues.greyColor));
    final fontStyle1e = GoogleFonts.poppins(
        textStyle: TextStyle(
            color: userInfo.read("pcState")
                ? constantValues.primaryColor
                : constantValues.greyColor));
    final fontStyle1f = GoogleFonts.poppins(textStyle: const TextStyle());
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          // width: size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/home.png"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      userInfo.read("pcState")
                          ? "Powercell Active"
                          : "Powercell Inactive",
                      style: fontStyle1e,
                    ),
                    buildTimer(context, fontStyle1b),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: tempPcStateColor!, width: 0.3),
                      ),
                      child: CircleAvatar(
                        radius: size.width * 0.25,
                        backgroundColor: constantValues.transparentColor,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: tempPcStateColor!, width: 0.3),
                          ),
                          child: CircleAvatar(
                            radius: size.width * 0.21,
                            backgroundColor: constantValues.transparentColor,
                            child: InkWell(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.145),
                              child: CircleAvatar(
                                radius: size.width * 0.17,
                                backgroundColor: tempPcStateColor,
                                child: Icon(
                                  CupertinoIcons.power,
                                  color: constantValues.whiteColor,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  userInfo.read("pcState")
                                      ? tempPcStateColor =
                                          const Color(0xffc62828)
                                      : tempPcStateColor =
                                          constantValues.primaryColor;
                                });
                                Future.delayed(
                                    const Duration(milliseconds: 800), () {
                                  setState(() {
                                    tempPcStateColor == Colors.red
                                        ? tempPcStateColor =
                                            constantValues.greyColor
                                        : !userInfo.read("pcState")
                                            ? tempPcStateColor =
                                                constantValues.greyColor
                                            : constantValues.primaryColor;
                                  });
                                });
                                Future.delayed(
                                    const Duration(milliseconds: 700), () {
                                  setState(() {
                                    userInfo.write(
                                        "pcState", !userInfo.read("pcState"));
                                    userInfo.read("pcState")
                                        ? _timerManager.startTimer()
                                        : _timerManager.resetTimer();
                                  });
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: size.width * 0.45,
                          child: Card(
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.cloud_download,
                                color: userInfo.read("pcState")
                                    ? constantValues.primaryColor
                                    : constantValues.greyColor,
                              ),
                              title: Text(
                                "Solar Input",
                                style: fontStyle1c,
                              ),
                              subtitle: Text(
                                userInfo.read("pcState")
                                    ? "25.5 kWh"
                                    : "0.0 kWh",
                                style: userInfo.read("isDarkTheme")
                                    ? fontStyle1d2
                                    : fontStyle1d1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.45,
                          child: Card(
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.cloud_upload,
                                color: userInfo.read("pcState")
                                    ? Colors.orange
                                    : constantValues.greyColor,
                              ),
                              title: Text(
                                "Solar Output",
                                style: fontStyle1c,
                              ),
                              subtitle: Text(
                                userInfo.read("pcState")
                                    ? "25.5 kWh"
                                    : "0.0 kWh",
                                style: userInfo.read("isDarkTheme")
                                    ? fontStyle1d2
                                    : fontStyle1d1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    SizedBox(
                      child: Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                "Power",
                                style: userInfo.read("isDarkTheme")
                                    ? fontStyle1d2
                                    : fontStyle1d1,
                              ),
                              subtitle: Text(
                                "${constantValues.currentPower} kWh",
                                style: fontStyle1e,
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  CupertinoIcons.forward,
                                  color: constantValues.greyColor,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            ListTile(
                              leading: Column(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.2,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor:
                                              userInfo.read("pcState")
                                                  ? Colors.lightBlueAccent
                                                  : constantValues.greyColor,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "Last week",
                                          style: TextStyle(
                                              color: constantValues.greyColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.2,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor:
                                              userInfo.read("pcState")
                                                  ? Colors.blue
                                                  : constantValues.greyColor,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "This week",
                                          style: TextStyle(
                                              color: constantValues.greyColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              title: SizedBox(
                                width: size.width * 0.65,
                                height: size.height * 0.13,
                                // child: BuildBarChart(
                                //   year: "2024",
                                //   month: "April",
                                //   sunday: Random().nextInt(30),
                                //   monday: Random().nextInt(30),
                                //   tuesday: Random().nextInt(30),
                                //   wednesday: Random().nextInt(30),
                                //   thursday: Random().nextInt(30),
                                //   friday: Random().nextInt(30),
                                //   saturday: Random().nextInt(30),
                                // ),
                                // child: SfSparkLineChart.custom(
                                //   //Enable the trackball
                                //   trackball: const SparkChartTrackball(
                                //       activationMode: SparkChartActivationMode.tap),
                                //   //Enable marker
                                //   marker: const SparkChartMarker(
                                //       displayMode: SparkChartMarkerDisplayMode.all),
                                //   //Enable data label
                                //   labelDisplayMode: SparkChartLabelDisplayMode.all,
                                //   xValueMapper: (int index) =>
                                //       chartmodel.data[index].day,
                                //   yValueMapper: (int index) =>
                                //       chartmodel.data[index].power,
                                //   dataCount: 5,
                                // ),
                                child: StackedBarChart(
                                  seriesList: _createSampleData(),
                                  animate: true,
                                  year: "2024",
                                  font: fontStyle1f,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTimer(BuildContext context, TextStyle font) {
    return ValueListenableBuilder<Duration>(
      valueListenable: constantValues.durationNotifier,
      builder: (context, value, child) {
        String twoDigits(int n) => n.toString().padLeft(2, "0");
        final hours = twoDigits(value.inHours.remainder(60));
        final minutes = twoDigits(value.inMinutes.remainder(60));
        final seconds = twoDigits(value.inSeconds.remainder(60));
        return Text(
          "$hours:$minutes:$seconds",
          style: font,
        );
      },
    );
  }
}

// BarChart
class BuildBarChart extends StatefulWidget {
  BuildBarChart({
    super.key,
    required this.year,
    required this.month,
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
  });
  final String year;
  final String month;
  late int sunday;
  late int monday;
  late int tuesday;
  late int wednesday;
  late int thursday;
  late int friday;
  late int saturday;

  @override
  _BuildBarChartState createState() => _BuildBarChartState();
}

class _BuildBarChartState extends State<BuildBarChart> {
  final random = Random();
  final constantValues = Get.find<Constants>();
  final userInfo = GetStorage();

  List<charts.Series<chartmodel.BarChartModel, String>> _createSampleData() {
    var data = [
      chartmodel.BarChartModel(
          widget.year,
          widget.month,
          'Sun',
          widget.sunday,
          userInfo.read("pcState")
              ? charts.ColorUtil.fromDartColor(Color.fromRGBO(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  1))
              : charts.ColorUtil.fromDartColor(Colors.grey)),
      chartmodel.BarChartModel(
          widget.year,
          widget.month,
          'Mon',
          widget.monday,
          userInfo.read("pcState")
              ? charts.ColorUtil.fromDartColor(Color.fromRGBO(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  1))
              : charts.ColorUtil.fromDartColor(Colors.grey)),
      chartmodel.BarChartModel(
          widget.year,
          widget.month,
          'Tue',
          widget.tuesday,
          userInfo.read("pcState")
              ? charts.ColorUtil.fromDartColor(Color.fromRGBO(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  1))
              : charts.ColorUtil.fromDartColor(Colors.grey)),
      chartmodel.BarChartModel(
          widget.year,
          widget.month,
          'Wed',
          widget.wednesday,
          userInfo.read("pcState")
              ? charts.ColorUtil.fromDartColor(Color.fromRGBO(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  1))
              : charts.ColorUtil.fromDartColor(Colors.grey)),
      chartmodel.BarChartModel(
          widget.year,
          widget.month,
          'Thur',
          widget.thursday,
          userInfo.read("pcState")
              ? charts.ColorUtil.fromDartColor(Color.fromRGBO(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  1))
              : charts.ColorUtil.fromDartColor(Colors.grey)),
      chartmodel.BarChartModel(
          widget.year,
          widget.month,
          'Fri',
          widget.friday,
          userInfo.read("pcState")
              ? charts.ColorUtil.fromDartColor(Color.fromRGBO(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  1))
              : charts.ColorUtil.fromDartColor(Colors.grey)),
      chartmodel.BarChartModel(
          widget.year,
          widget.month,
          'Sat',
          widget.saturday,
          userInfo.read("pcState")
              ? charts.ColorUtil.fromDartColor(Color.fromRGBO(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  1))
              : charts.ColorUtil.fromDartColor(Colors.grey)),
    ];
    return [
      charts.Series(
          id: "total_csr",
          data: data,
          domainFn: (chartmodel.BarChartModel series, _) => series.day,
          measureFn: (chartmodel.BarChartModel series, _) => series.power,
          colorFn: (chartmodel.BarChartModel series, _) => series.color),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fontStyle1a = GoogleFonts.lato(
        textStyle: const TextStyle(fontWeight: FontWeight.bold));
    final fontStyle1b = GoogleFonts.lato(textStyle: const TextStyle());
    return charts.BarChart(
      _createSampleData(),
      animate: true,
      animationDuration: const Duration(milliseconds: 1000),
      selectionModels: [
        charts.SelectionModelConfig(
          changedListener: (model) async {
            if (widget.year != "") {
              // var id = model.selectedSeries[0].displayName;
              var dailyPower = model.selectedSeries[0]
                  .measureFn(model.selectedDatum[0].index)
                  .toString();
              var day = model.selectedSeries[0]
                  .domainFn(model.selectedDatum[0].index)
                  .toLowerCase();

              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Details", style: fontStyle1a),
                      content: Text(
                          "Total power consumed on ${day.capitalizeFirst} is  $dailyPower kWh",
                          style: fontStyle1b),
                    );
                  });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: constantValues.errorColor,
                  content: const Text("No year selected!")));
            }
          },
        )
      ],
    );
  }
}
