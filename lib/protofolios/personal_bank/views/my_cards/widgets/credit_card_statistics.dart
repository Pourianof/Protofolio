import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';

class CreditCardStatistics extends StatelessWidget {
  const CreditCardStatistics({super.key});

  _provideBankLabel(Color color, String title) {
    const radius = 15.0;
    return Row(
      children: [
        Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: radius,
        ),
        NonActiveLink(title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BankCard(
      child: Column(
        children: [
          const Expanded(child: _CCPieChart()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _provideBankLabel(AppColors.chartYellow, "بانک ملی"),
                  const SizedBox(height: 15),
                  _provideBankLabel(AppColors.pink, "بانک تجارت"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _provideBankLabel(AppColors.chartCyan, "بانک صادرات"),
                  const SizedBox(height: 15),
                  _provideBankLabel(AppColors.chartBlue, "بانک شهر"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CCPieChart extends StatelessWidget {
  const _CCPieChart({super.key});

  _generatePieData(double value, double radius, Alignment align, Color color) {
    return PieChartSectionData(
      value: value,
      showTitle: false,
      radius: radius,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    const radius = 40.0;
    const overlayStroke = 10.0;
    return Stack(children: [
      PieChart(
        PieChartData(
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: radius,
          sections: [
            _generatePieData(25, 45, Alignment.topLeft, AppColors.chartCyan),
            _generatePieData(25, 50, Alignment.topRight, AppColors.pink),
            _generatePieData(
                25, 40, Alignment.bottomRight, AppColors.chartBlue),
            _generatePieData(
                25, 60, Alignment.bottomLeft, AppColors.chartYellow),
          ],
        ),
      ),
      Center(
        child: Container(
          width: radius * 2 + overlayStroke * 2,
          height: radius * 2 + overlayStroke * 2,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
              width: overlayStroke,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
    ]);
  }
}
