import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/icon_link.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/utils/number_text.dart';

class SummaryItem extends StatelessWidget {
  final ColoredIcon icon;
  final String title;
  final String? amount;
  final String? subtitle;
  final bool titleReverseOrder;
  SummaryItem({
    super.key,
    required this.icon,
    required this.title,
    this.amount,
    this.subtitle,
    this.titleReverseOrder = false,
  }) {
    if (amount == null && subtitle == null) {
      throw Exception(
          "amount and subtitle are both null. Either one must specified.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleCol = [
      NonActiveLink(title),
      const SizedBox(
        height: 5,
      ),
      subtitle != null
          ? Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          : NumberText(
              textNumber: amount,
              style: Theme.of(context).textTheme.labelLarge,
            ),
    ];
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
            children: titleReverseOrder ? titleCol.reversed.toList() : titleCol,
          )
        ],
      ),
    );
  }
}
