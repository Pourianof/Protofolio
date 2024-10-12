import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/icon_link.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/utils/number_text.dart';

class SummaryItem extends StatelessWidget {
  final ColoredIcon icon;
  final String title;
  final String amount;
  const SummaryItem({
    super.key,
    required this.amount,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BankCard(
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
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          )
        ],
      ),
    );
  }
}
