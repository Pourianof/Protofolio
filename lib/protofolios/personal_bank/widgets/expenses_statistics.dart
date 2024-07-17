import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpensesStatistics extends StatelessWidget {
  const ExpensesStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: PieChart(
        PieChartData(
          startDegreeOffset: 180,
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 5,
          centerSpaceRadius: 0,
          sections: showingSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      4,
      (i) {
        const color0 = Color.fromARGB(255, 52, 60, 106);
        const color1 = Color.fromARGB(255, 252, 122, 0);
        const color2 = Color.fromARGB(255, 24, 20, 243);
        const color3 = Color.fromARGB(255, 251, 0, 255);

        getRadius(double val) {
          return 50 + 100 - val;
        }

        const style =
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0,
              value: 30,
              title: '30%\nتفریح',
              radius: getRadius(30),
              titlePositionPercentageOffset: 0.55,
              titleStyle: style,
            );
          case 1:
            return PieChartSectionData(
              color: color1,
              value: 15,
              title: '15%\nپرداخت قبوض',
              radius: getRadius(15),
              titleStyle: style,
              titlePositionPercentageOffset: 0.55,
            );
          case 2:
            return PieChartSectionData(
              color: color2,
              value: 35,
              title: '35%\nسایر',
              radius: getRadius(35),
              titleStyle: style,
              titlePositionPercentageOffset: 0.6,
            );
          case 3:
            return PieChartSectionData(
              color: color3,
              value: 20,
              title: '20%\nسرمایه گذاری',
              radius: getRadius(20),
              titleStyle: style,
              titlePositionPercentageOffset: 0.55,
            );
          default:
            throw Error();
        }
      },
    );
  }
}
