import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';

// ignore: must_be_immutable
class BalanceHistoryChartCard extends StatelessWidget {
  BalanceHistoryChartCard({super.key});

  final List<Color> gradientColors = [
    AppColors.darkBlue,
    AppColors.darkBlue,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: LineChart(
          mainData(),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('فرو', style: style);
        break;
      case 1:
        text = const Text('ارد', style: style);
        break;
      case 2:
        text = const Text('خرد', style: style);
        break;
      case 3:
        text = const Text('تیر', style: style);
        break;
      case 4:
        text = const Text('مرداد', style: style);
        break;
      case 5:
        text = const Text('شهر', style: style);
        break;
      case 6:
        text = const Text('مهر', style: style);
        break;
      default:
        text = const Text('تیر', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.mainLightGrey,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 1:
        text = '200';
        break;
      case 2:
        text = '400';
        break;
      case 3:
        text = '600';
        break;
      case 4:
        text = '800';
        break;
      default:
        return Container();
    }

    return Row(
      children: [
        Container(width: 8, height: 1, color: AppColors.mainLightGrey),
        const SizedBox(
          width: 5,
        ),
        Text(text, style: style, textAlign: TextAlign.left),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.mainLightGrey_200,
            dashArray: [5, 5],
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.mainLightGrey_200,
            dashArray: [5, 5],
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 7,
      minY: 0,
      maxY: 4,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 0.5),
            FlSpot(0.5, 1.5),
            FlSpot(1.2, 1.1),
            FlSpot(1.8, 2.3),
            FlSpot(2.3, 2.1),
            FlSpot(3, 3.9),
            FlSpot(4.1, 1.05),
            FlSpot(4.8, 2.8),
            FlSpot(5.7, 1.2),
            FlSpot(6.45, 3.15),
            FlSpot(7, 2.95),
          ],
          isCurved: true,
          color: AppColors.darkBlue,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: const LinearGradient(
              colors: [Color.fromARGB(49, 82, 80, 228), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
