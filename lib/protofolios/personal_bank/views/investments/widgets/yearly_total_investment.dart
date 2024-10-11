import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';

class YearlyTotalInvestment extends StatelessWidget {
  const YearlyTotalInvestment({super.key});

  @override
  Widget build(BuildContext context) {
    return const BankCard(child: _YearlyInvestChart());
  }
}

class _YearlyInvestChart extends StatelessWidget {
  const _YearlyInvestChart({super.key});

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
    return LineChart(LineChartData(
      extraLinesData:
          ExtraLinesData(horizontalLines: [extraHRLine(0), extraHRLine(40)]),
      gridData: const FlGridData(
        drawVerticalLine: false,
        drawHorizontalLine: true,
        horizontalInterval: 10,
      ),
      titlesData: FlTitlesData(
        rightTitles: const AxisTitles(),
        topTitles: const AxisTitles(),
        leftTitles: AxisTitles(
          drawBelowEverything: false,
          sideTitles: SideTitles(
            reservedSize: 80,
            showTitles: true,
            interval: 10,
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
            showTitles: true,
            interval: 1,
            reservedSize: 25,
            getTitlesWidget: (value, meta) {
              if (value < 2019) {
                return Container();
              }
              return SideTitleWidget(
                axisSide: AxisSide.bottom,
                child: NonActiveLink(
                  '$value',
                ),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          isCurved: true,
          curveSmoothness: 0,
          color: AppColors.chartYellow,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (p0, p1, p2, p3) {
              return FlDotCirclePainter(
                color: Colors.white,
                strokeColor: AppColors.chartYellow,
                strokeWidth: 3,
              );
            },
          ),
          belowBarData: BarAreaData(show: false),
          spots: const [
            FlSpot(2019, 5),
            FlSpot(2020, 24),
            FlSpot(2021, 18),
            FlSpot(2022, 38),
            FlSpot(2023, 21),
            FlSpot(2024, 29.5),
          ],
        )
      ],
      minX: 2018.8,
      maxX: 2024,
      minY: 0,
      maxY: 40,
    ));
  }
}
