import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SimplePieChart extends StatelessWidget {
  const SimplePieChart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Pie Chart')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PieChart(
            PieChartData(
              sections: _getSections(),
              borderData: FlBorderData(show: false),
              sectionsSpace: 2,
              centerSpaceRadius: 40,
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> _getSections() {
    return [
      PieChartSectionData(
        value: 40,
        title: '40%',
        color: Colors.blue,
        radius: 50,
        titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: 30,
        title: '30%',
        color: Colors.red,
        radius: 50,
        titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: 20,
        title: '20%',
        color: Colors.green,
        radius: 50,
        titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: 10,
        title: '10%',
        color: Colors.orange,
        radius: 50,
        titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ];
  }
}
