import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';

class MonthlyRevenue extends StatelessWidget {
  const MonthlyRevenue({super.key});

  @override
  Widget build(BuildContext context) {
    return BankCard(child: _MonthlyRevChart());
  }
}

class _MonthlyRevChart extends StatelessWidget {
  const _MonthlyRevChart({super.key});

  extraHRLine(double y) {
    return HorizontalLine(
      y: y,
      color: Colors.blueGrey,
      strokeWidth: 0.4,
      dashArray: [8, 4],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            extraHRLine(0),
            extraHRLine(40),
          ],
        ),
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 10,
        ),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          rightTitles: const AxisTitles(),
          topTitles: const AxisTitles(),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              interval: 10,
              showTitles: true,
              reservedSize: 80,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: AxisSide.left,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NonActiveLink('$value'),
                      const NonActiveLink(
                        'میلیون تومان',
                        style: TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              interval: 0.1,
              showTitles: true,
              reservedSize: 25,
              getTitlesWidget: (value, meta) {
                final year = value + 2018.7;
                if (year < 2018 || year > 2024 || (year - year.toInt()) != 0) {
                  return Container();
                }
                return SideTitleWidget(
                  axisSide: AxisSide.bottom,
                  child: NonActiveLink("$year"),
                );
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            preventCurveOverShooting: true,
            color: AppColors.chartCyan,
            barWidth: 3,
            dotData: const FlDotData(
              show: false,
            ),
            spots: const [
              FlSpot(0, 11),
              FlSpot(0.3, 14),
              FlSpot(0.9, 21),
              FlSpot(1.4, 12),
              FlSpot(1.9, 28),
              FlSpot(2.8, 33),
              FlSpot(3.3, 20.5),
              FlSpot(3.8, 29),
              FlSpot(4.6, 24),
              FlSpot(5.1, 16),
              FlSpot(5.8, 35),
            ],
          )
        ],
        minX: 0,
        maxX: 5.8,
        minY: 0,
        maxY: 40,
      ),
    );
  }
}
