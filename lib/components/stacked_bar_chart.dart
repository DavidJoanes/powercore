// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:charts_flutter_new/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:get/get.dart';

import '../controllers/constants.dart';

final constantValues = Get.find<Constants>();

class StackedBarChart extends StatelessWidget {
  late List<Series<dynamic, String>> seriesList;
  final bool animate;
  final String year;
  var font;

  StackedBarChart(
      {super.key,
      required this.seriesList,
      required this.animate,
      required this.year,
      required this.font});

  /// Creates a stacked [BarChart] with sample data and no transition.
  // factory StackedBarChart.withSampleData() {
  //   return StackedBarChart(
  //     seriesList: _createSampleData(),
  //     // Disable animations for image tests.
  //     animate: false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      selectionModels: [
        charts.SelectionModelConfig(
          changedListener: (model) async {
            if (year != "") {
              var dailyPower = model.selectedSeries[0]
                  .measureFn(model.selectedDatum[0].index)
                  .toString();
              var day = model.selectedSeries[0]
                  .domainFn(model.selectedDatum[0].index)
                  .toLowerCase();

              Get.snackbar("Details",
                  "Total power consumed on ${day.capitalizeFirst} is  ${double.parse(dailyPower).toStringAsFixed(2)} kWh",
                  titleText: Text(
                    "Details",
                    style: font,
                  ));
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

/// Sample ordinal data type.
class Ordinalpower {
  final String day;
  final double power;

  Ordinalpower(this.day, this.power);
}
