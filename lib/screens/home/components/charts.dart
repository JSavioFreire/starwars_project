import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_project/model/charts_model.dart';
import 'package:starwars_project/provider/api/fetch_api.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Charts extends StatelessWidget {
  final Api controller;

  const Charts({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Api api = Provider.of<Api>(context);
    late List<GDPData> chartData;
    late TooltipBehavior tooltipBehavior;

    chartData = api.getChartData();
    tooltipBehavior = TooltipBehavior(enable: true);
    return SizedBox(
        height: 200,
        child: SfCircularChart(
          title: ChartTitle(text: 'Idade'),
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          tooltipBehavior: tooltipBehavior,
          series: <CircularSeries>[
            RadialBarSeries<GDPData, String>(
                dataSource: chartData,
                xValueMapper: (GDPData data, _) => data.continent,
                yValueMapper: (GDPData data, _) => data.gdp,
                dataLabelSettings: const DataLabelSettings(isVisible: false),
                enableTooltip: true,
                maximumValue: 200)
          ],
        ));
  }
}
