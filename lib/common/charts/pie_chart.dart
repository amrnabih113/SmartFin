import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:smartFin/core/constants/colors.dart';

class MyPieChart extends StatelessWidget {
  final List<double> sections;

  const MyPieChart({
    super.key,
    required this.sections,
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
    final gradients = [
      MyColors.customGradient(Colors.cyan),
      MyColors.customGradient(Colors.red),
      MyColors.customGradient(Colors.purple),
      MyColors.customGradient(Colors.yellow),
      MyColors.customGradient(Colors.green),
      MyColors.customGradient(Colors.pink),
      MyColors.customGradient(Colors.blue),
      MyColors.customGradient(Colors.orange),
    ];
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
