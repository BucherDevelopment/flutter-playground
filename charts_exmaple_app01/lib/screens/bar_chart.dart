import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 10, // Maximale Höhe der Y-Achse
            barGroups: [
              makeGroupData(0, 5),
              makeGroupData(1, 8),
              makeGroupData(2, 6),
              makeGroupData(3, 7),
              makeGroupData(4, 4),
            ],
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 40),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    return Text(
                      'Tag ${value.toInt()}',
                      style: TextStyle(fontSize: 12),
                    );
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: true),
          ),
        ),
      ),
    );
  }

  /// Hilfsfunktion zum Erstellen von Balkengruppen
  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 15,
          color: Colors.blue,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
