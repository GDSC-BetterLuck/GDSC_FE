import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InfoGraphViewWidget extends StatefulWidget {
  const InfoGraphViewWidget({super.key, required this.info});
  final List<Map<String, String>> info;

  @override
  State<InfoGraphViewWidget> createState() => _InfoGraphViewWidgetState();
}
class Data {
  Data(this.date, this.value);

  final DateTime date;
  final double value;
}
class _InfoGraphViewWidgetState extends State<InfoGraphViewWidget> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        series: <LineSeries<Data, DateTime>>[
              LineSeries<Data, DateTime>(
                dataSource: <Data>[
                  Data(DateTime(2023, 1, 1), 30),
                  Data(DateTime(2023, 2, 1), 50),
                  Data(DateTime(2023, 3, 1), 20),
                  Data(DateTime(2023, 4, 1), 70),
                  Data(DateTime(2023, 5, 1), 90),
                ],
                xValueMapper: (Data data, _) => data.date,
                yValueMapper: (Data data, _) => data.value,
              ),
        ],
        // Initialize category axis
        primaryXAxis: const DateTimeAxis(),
        primaryYAxis: const NumericAxis(),

      );
  }
}
