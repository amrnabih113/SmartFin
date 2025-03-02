import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:smartFin/core/constants/colors.dart';

class MyPieChart extends StatelessWidget {
  final List<double> sections;
  final List<MaterialColor> colors;

  const MyPieChart({
    super.key,
    required this.sections,
    this.colors = const [
      Colors.cyan,
      Colors.red,
      Colors.purple,
      Colors.yellow,
      Colors.green,
      Colors.pink,
      Colors.blue,
      Colors.orange,
    ],
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 280,
      child: PieChart(
        PieChartData(
          sectionsSpace: 10,
          centerSpaceRadius: 110,
          borderData: FlBorderData(show: false),
          pieTouchData: PieTouchData(enabled: false),
          startDegreeOffset: -90,
          sections: _chartSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> _chartSections() {
    final gradients = colors.map((color) {
      return MyColors.customGradient(color);
    }).toList();
    return List.generate(
      sections.length,
      (index) => PieChartSectionData(
        showTitle: false,
        value: sections[index],
        gradient: gradients[index % gradients.length],
        radius: 20,
      ),
    );
  }
}
