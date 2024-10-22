import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/summary_item.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/summary_wrapper.dart';

// ignore: must_be_immutable
class InvestmentsSummary extends StatelessWidget {
  InvestmentsSummary({super.key});

  _generateSummaryItem(ColoredIcon icon, String title, String amount) {
    return SummaryItem(amount: amount, icon: icon, title: title);
  }

  @override
  Widget build(BuildContext context) {
    return SummaryWrapper(items: [
      _generateSummaryItem(
        ColoredIcon(
          color: const Color.fromARGB(255, 22, 219, 203),
          icon: BankIcons.moneyBag,
        ),
        "تمام مقدار سرمایه گذاری شده",
        "250000000 تومان",
      ),
      _generateSummaryItem(
        ColoredIcon(
          color: const Color.fromARGB(255, 255, 130, 172),
          icon: BankIcons.pieChart,
        ),
        "تعداد سرمایه گذاری ها",
        "1250",
      ),
      _generateSummaryItem(
        ColoredIcon(
          color: const Color.fromARGB(255, 57, 107, 255),
          icon: BankIcons.expense,
        ),
        "نرخ بازگشت",
        "+5.80%",
      ),
    ]);
  }
}
