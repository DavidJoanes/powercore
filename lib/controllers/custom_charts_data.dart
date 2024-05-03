import 'dart:math';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:get_storage/get_storage.dart';

var userInfo = GetStorage();

class BarChartModel {
  late String year;
  late String month;
  late String day;
  late int power;
  late charts.Color color;

  BarChartModel(this.year, this.month, this.day, this.power, this.color);
}

// List<FlSpot> chartData = [
//   FlSpot(1, Random().nextDouble() * 200),
//   FlSpot(2, Random().nextDouble() * 200),
//   FlSpot(3, userInfo.read("categoryRevenue")["months"]["mar"] ?? 0),
//   FlSpot(4, userInfo.read("categoryRevenue")["months"]["apr"] ?? 0),
//   FlSpot(5, userInfo.read("categoryRevenue")["months"]["may"] ?? 0),
//   FlSpot(6, userInfo.read("categoryRevenue")["months"]["jun"] ?? 0),
//   FlSpot(7, userInfo.read("categoryRevenue")["months"]["jul"] ?? 0),
//   FlSpot(8, userInfo.read("categoryRevenue")["months"]["aug"] ?? 0),
//   FlSpot(9, userInfo.read("categoryRevenue")["months"]["sep"] ?? 0),
//   FlSpot(10, userInfo.read("categoryRevenue")["months"]["oct"] ?? 0),
//   FlSpot(11, userInfo.read("categoryRevenue")["months"]["nov"] ?? 0),
//   FlSpot(12, userInfo.read("categoryRevenue")["months"]["dec"] ?? 0),
// ];

class DailyPowerData {
  DailyPowerData(this.day, this.power);

  final String day;
  final double power;
}

List<DailyPowerData> data = [
  DailyPowerData('Sun', Random().nextDouble() * 31),
  DailyPowerData('Mon', Random().nextDouble() * 31),
  DailyPowerData('Tue', Random().nextDouble() * 31),
  DailyPowerData('Wed', Random().nextDouble() * 31),
  DailyPowerData('Thu', Random().nextDouble() * 31),
  DailyPowerData('Fri', Random().nextDouble() * 31),
  DailyPowerData('Sat', Random().nextDouble() * 31),
];

