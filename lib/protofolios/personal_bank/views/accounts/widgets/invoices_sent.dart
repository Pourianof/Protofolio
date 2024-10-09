import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/static_data/invoices.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/accounts/widgets/icon_link.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';
import 'package:my_portfolio/utils/number_text.dart';

class InvoicesSent extends StatelessWidget {
  const InvoicesSent({super.key});

  @override
  Widget build(BuildContext context) {
    return BankCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: INVOICES
            .map((inv) => Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          IconLink(icon: inv.icon),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                inv.reciver,
                                style: TextStyle(
                                  color: AppColors.mainLightGrey_200,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                inv.date,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    NumberText(
                      textNumber: "${inv.amount}\$",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}
