import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/investment_model.dart';
import 'package:my_portfolio/protofolios/personal_bank/static_data/investments.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/amount_text.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/icon_link.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/protofolios/helpers/utils.dart';

class InvestmentsList extends StatelessWidget {
  const InvestmentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: INVESTMENTS
            .map(
              (inv) => InvestmentItem(investment: inv),
            )
            .toList());
  }
}

class InvestmentItem extends StatelessWidget {
  final InvestmentModel investment;
  const InvestmentItem({
    super.key,
    required this.investment,
  });

  @override
  Widget build(BuildContext context) {
    return BankCard(
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                IconLink(
                  icon: investment.icon,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      investment.stockTitle,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    NonActiveLink(investment.stockType),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${toCommaSeperated(investment.investValue)} تومان',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const NonActiveLink("ارزش سرمایه گذاری"),
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AmountText(
                amount: investment.returnValue,
                suffix: '%',
              ),
              const NonActiveLink("ارزش بازگشتی"),
            ],
          ),
        ],
      ),
    );
  }
}
