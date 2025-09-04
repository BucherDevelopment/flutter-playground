import 'package:charts_exmaple_app01/screens/bar_chart.dart';
import 'package:charts_exmaple_app01/screens/pie_chart.dart';
import 'package:charts_exmaple_app01/screens/simple_line_chart';
import 'package:charts_exmaple_app01/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedPage = 'bar-chart';
  void _selectPage(String identifier) {
    Navigator.of(context).pop();
    setState(() {
      _selectedPage = identifier;
      debugPrint('Selected Page: $_selectedPage');
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget displayedChart = SimpleBarChart();
    if (_selectedPage == 'line-chart') {
      displayedChart = SimpleLineChart();
    } else if (_selectedPage == 'pie-chart') {
      displayedChart = SimplePieChart();
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Tabs Example')),
      drawer: MainDrawer(onSelectScreen: _selectPage),
      body: displayedChart,
    );
  }
}
