import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GraphPage(),
    );
  }
}

class GraphModel {
  final List<double> semResults;

  GraphModel(this.semResults);
}

class GraphPage extends StatefulWidget {
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  late GraphModel graphModel;

  @override
  void initState() {
    super.initState();
    // Initialize with default values
    graphModel = GraphModel([100, 200, 300, 400, 500, 600]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Mark Graph'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: true),
                  minX: 0,
                  maxX: 5,
                  minY: 0,
                  maxY: 700,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, graphModel.semResults[0]),
                        FlSpot(1, graphModel.semResults[1]),
                        FlSpot(2, graphModel.semResults[2]),
                        FlSpot(3, graphModel.semResults[3]),
                        FlSpot(4, graphModel.semResults[4]),
                        FlSpot(5, graphModel.semResults[5]),
                      ],
                      isCurved: true,
                      color:Colors.green,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Student Performance Summary',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('Semester 1: ${graphModel.semResults[0]} marks'),
                  Text('Semester 2: ${graphModel.semResults[1]} marks'),
                  Text('Semester 3: ${graphModel.semResults[2]} marks'),
                  Text('Semester 4: ${graphModel.semResults[3]} marks'),
                  Text('Semester 5: ${graphModel.semResults[4]} marks'),
                  Text('Semester 6: ${graphModel.semResults[5]} marks'),
                  SizedBox(height: 20),
                  Text(
                    'Overall Performance: ${calculateOverallPerformance()}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String calculateOverallPerformance() {
    double average =
        graphModel.semResults.reduce((a, b) => a + b) / graphModel.semResults.length;
    if (average >= 500) {
      return 'Excellent';
    } else if (average >= 400) {
      return 'Good';
    } else if (average >= 300) {
      return 'Average';
    } else {
      return 'Needs Improvement';
    }
  }
}
