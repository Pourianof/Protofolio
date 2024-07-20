import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';

class ExpensesChart extends StatelessWidget {
  const ExpensesChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BarChart(
          BarChartData(
            barTouchData: barTouchData,
            titlesData: titlesData,
            borderData: borderData,
            barGroups: barGroups,
            gridData: const FlGridData(show: false),
            alignment: BarChartAlignment.spaceAround,
            maxY: 20,
          ),
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: AppColors.mainLightGrey,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.mainLightGrey,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'فر';
        break;
      case 1:
        text = 'ار';
        break;
      case 2:
        text = 'خر';
        break;
      case 3:
        text = 'تی';
        break;
      case 4:
        text = 'مر';
        break;
      case 5:
        text = 'شه';
        break;
      case 6:
        text = 'مه';
        break;
      default:
        text = 'آبان';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  BarChartGroupData provideBar(int x, double y, {bool isSelcted = false}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 40,
          borderRadius: BorderRadius.circular(10),
          color: isSelcted
              ? const Color.fromARGB(255, 22, 219, 203)
              : AppColors.mainLightGrey_100,
        )
      ],
      showingTooltipIndicators: [0],
    );
  }

  List<BarChartGroupData> get barGroups => [
        provideBar(0, 8),
        provideBar(1, 10),
        provideBar(2, 14),
        provideBar(3, 15, isSelcted: true),
        provideBar(4, 13),
        provideBar(5, 10),
      ];
}
