import 'package:d_chart/d_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff106FA4),
      fontSize: 8,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('Semester 1', style: style);
        break;
      case 7:
        text = const Text('Semester 2', style: style);
        break;
      case 12:
        text = const Text('Semester 3', style: style);
        break;

      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1';
        break;
      case 2:
        text = '2';
        break;
      case 3:
        text = '3';
        break;
      case 4:
        text = '4';
        break;

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: DChartLine(
        pointColor: (lineData, index, id) {
          return Colors.black;
        },
        includePoints: true,
        includeArea: true,
        data: const [
          {
            'id': 'Line',
            'data': [
              {'domain': 1, 'measure': 3},
              {'domain': 2, 'measure': 2.5},
              {'domain': 3, 'measure': 1},
            ],
          },
        ],
        lineColor: (lineData, index, id) => const Color(0xff0E9CFF),
      ),
    );
  }
}
