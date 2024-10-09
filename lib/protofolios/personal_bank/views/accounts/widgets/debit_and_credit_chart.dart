import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';

class DebitAndCreditChart extends StatelessWidget {
  DebitAndCreditChart({super.key});

  static const withdrawColor = Color.fromARGB(255, 76, 121, 255);
  static const despositeColor = Color.fromARGB(255, 255, 130, 172);

  final faDays = ["شن", "یک", "دو", 'سه', "چه", "پن", "جم"];

  final dataList = [
    const _BarData(135, 235),
    const _BarData(106, 186),
    const _BarData(102, 132),
    const _BarData(212, 123),
    const _BarData(150, 214),
    const _BarData(158, 105),
    const _BarData(179, 216),
  ];

  BarChartGroupData generateBarGroup(
    int x,
    double value,
    double shadowValue,
  ) {
    return BarChartGroupData(
      barsSpace: 10,
      x: x,
      barRods: [
        BarChartRodData(
          borderRadius: BorderRadius.circular(10),
          toY: value,
          color: withdrawColor,
          width: 30,
        ),
        BarChartRodData(
          borderRadius: BorderRadius.circular(10),
          toY: shadowValue,
          color: despositeColor,
          width: 30,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const normalStyle = TextStyle(color: AppColors.mainLightGrey);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: "در این هفته ",
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: "7560\$",
                    ),
                    TextSpan(
                      text: " پرداخت شده و ",
                      style: normalStyle,
                    ),
                    TextSpan(
                      text: "5420\$",
                    ),
                    TextSpan(
                      text: " کسب شده",
                      style: normalStyle,
                    ),
                  ]),
                ),
              ),
              Wrap(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: withdrawColor,
                    ),
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("بدهکاری"),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: despositeColor,
                    ),
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("اعتبار"),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                borderData: FlBorderData(
                  show: false,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  leftTitles: const AxisTitles(
                    drawBelowEverything: false,
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 36,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(faDays[index]),
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                ),
                gridData: const FlGridData(
                  show: false,
                  drawVerticalLine: false,
                ),
                barGroups: dataList.asMap().entries.map((e) {
                  final index = e.key;
                  final data = e.value;
                  return generateBarGroup(
                    index,
                    data.value,
                    data.shadowValue,
                  );
                }).toList(),
                maxY: 250,
                barTouchData: BarTouchData(
                  enabled: true,
                  handleBuiltInTouches: false,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (group) => Colors.transparent,
                    tooltipMargin: 0,
                    getTooltipItem: (
                      BarChartGroupData group,
                      int groupIndex,
                      BarChartRodData rod,
                      int rodIndex,
                    ) {
                      return BarTooltipItem(
                        rod.toY.toString(),
                        TextStyle(
                          fontWeight: FontWeight.bold,
                          color: rod.color,
                          fontSize: 18,
                          shadows: const [
                            Shadow(
                              color: Colors.black26,
                              blurRadius: 12,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BarData {
  const _BarData(this.value, this.shadowValue);
  final double value;
  final double shadowValue;
}
