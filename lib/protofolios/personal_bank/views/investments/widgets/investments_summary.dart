import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/icon_link.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/utils/number_text.dart';

// ignore: must_be_immutable
class InvestmentsSummary extends StatelessWidget {
  InvestmentsSummary({super.key});

  late BuildContext _currentContext;
  _generateSummaryItem(ColoredIcon icon, String title, String amount) {
    return Flexible(
      flex: 1,
      child: BankCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconLink(
              icon: icon,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NonActiveLink(title),
                const SizedBox(
                  height: 5,
                ),
                NumberText(
                  textNumber: amount,
                  style: Theme.of(_currentContext).textTheme.labelLarge,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _currentContext = context;
    return Row(
      children: [
        _generateSummaryItem(
          ColoredIcon(
            color: const Color.fromARGB(255, 22, 219, 203),
            icon: BankIcons.moneyBag,
          ),
          "تمام مقدار سرمایه گذاری شده",
          "250000000 تومان",
        ),
        const SizedBox(
          width: 30,
        ),
        _generateSummaryItem(
          ColoredIcon(
            color: const Color.fromARGB(255, 255, 130, 172),
            icon: BankIcons.pieChart,
          ),
          "تعداد سرمایه گذاری ها",
          "1250",
        ),
        const SizedBox(
          width: 30,
        ),
        _generateSummaryItem(
          ColoredIcon(
            color: const Color.fromARGB(255, 57, 107, 255),
            icon: BankIcons.expense,
          ),
          "نرخ بازگشت",
          "+5.80%",
        ),
      ],
    );
  }
}
