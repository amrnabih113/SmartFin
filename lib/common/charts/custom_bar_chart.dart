import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';

class CustomBarChart extends StatefulWidget {
  final List<double> bars;
  final List<String> labels;
  final MaterialColor highlightedColor;

  const CustomBarChart({
    super.key,
    required this.bars,
    required this.labels,
    this.highlightedColor = Colors.cyan,
  });

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _selectedIndex >= 0
            ? Text(
                '\$${widget.bars[_selectedIndex].toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleLarge,
              )
            : Container(),
        const SizedBox(height: 10),
        AspectRatio(
          aspectRatio: 1.6,
          child: BarChart(
            _chartData,
          ),
        ),
      ],
    );
  }

  BarChartData get _chartData {
    return BarChartData(
      barTouchData: _barTouchData,
      titlesData: _titlesData,
      borderData: _borderData,
      gridData: _gridData,
      barGroups: _barGroups,
    );
  }

  BarTouchData get _barTouchData {
    return BarTouchData(
      touchCallback: (event, response) {
        if (response == null || response.spot == null) {
          return;
        }
        setState(() {
          _selectedIndex = response.spot!.touchedBarGroupIndex;
        });
      },
    );
  }

  FlTitlesData get _titlesData {
    return FlTitlesData(
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (double value, TitleMeta meta) {
            return Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                widget.labels[value.toInt()],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          },
          reservedSize: 32,
        ),
      ),
    );
  }

  FlBorderData get _borderData {
    return FlBorderData(show: false);
  }

  FlGridData get _gridData {
    return FlGridData(
      drawHorizontalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
            color: MyHelperFunctions.isDarkMode(context)
                ? Colors.white.withOpacity(0.5)
                : Colors.black.withOpacity(0.5),
            strokeWidth: 0.5,
            dashArray: [6, 6]);
      },
      drawVerticalLine: false,
    );
  }

  List<BarChartGroupData> get _barGroups {
    return List.generate(
      widget.bars.length,
      (index) => _barGroup(
        index,
        widget.bars[index],
        isHighlighted: index == _selectedIndex,
      ),
    );
  }

  BarChartGroupData _barGroup(int x, double y, {bool isHighlighted = false}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          gradient: isHighlighted
              ? MyColors.customGradient(widget.highlightedColor)
              : null,
          color: widget.highlightedColor.withOpacity(0.4),
          width: 25,
          borderRadius: BorderRadius.circular(10),
        ),
      ],
    );
  }
}
