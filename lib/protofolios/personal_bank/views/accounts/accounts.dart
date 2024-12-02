import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/accounts/widgets/IconicLastTransactions.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/accounts/widgets/debit_and_credit_chart.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/accounts/widgets/invoices_sent.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/creadit_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/summary_item.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/summary_wrapper.dart';
import 'package:my_portfolio/shared/partition_layout/partition_layout.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return PartitionLayout(
      partitions: [
        PartitionRow(
          [
            PartitionItem(const AcountSummary(), 100),
          ],
        ),
        PartitionRow(
          [
            PartitionItem(const MediumTitle("آخرین تراکنش ها"), 65, 1),
            PartitionItem(
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MediumTitle("کارت‌های من"),
                    MediumTitle("دیدن همه"),
                  ],
                ),
                35,
                2),
          ],
        ),
        PartitionRow(
          [
            PartitionItem(IconicLastTransactions(), 65, 1),
            PartitionItem(
              const CreditCard(
                styleTheme: CreaditCardStyleTheme.highlight,
              ),
              35,
              2,
            )
          ],
          height: 235,
        ),
        PartitionRow(
          [
            PartitionItem(const MediumTitle("چشم انداز اعتبار و بدهی"), 70, 3),
            PartitionItem(const MediumTitle("صورت حساب"), 30, 4),
          ],
        ),
        PartitionRow(
          [
            PartitionItem(DebitAndCreditChart(), 70, 3),
            PartitionItem(const InvoicesSent(), 30, 4)
          ],
          height: 400,
        )
      ],
    );
  }
}

class AcountSummary extends StatelessWidget {
  const AcountSummary({super.key});

  _createSummaryItem(IconData icon, String title, int amount, Color iconColor,
      Color iconBackgroundColor) {
    return SummaryItem(
      icon: ColoredIcon(color: iconColor, icon: icon),
      title: title,
      amount: "$amount\$",
    );
  }

  @override
  Widget build(BuildContext context) {
    return SummaryWrapper(
      items: [
        _createSummaryItem(
          BankIcons.balance,
          "موجودی",
          12750,
          const Color.fromARGB(255, 255, 185, 56),
          const Color.fromARGB(255, 255, 245, 217),
        ),
        _createSummaryItem(
          BankIcons.income,
          "درآمد",
          5600,
          const Color.fromARGB(255, 57, 107, 255),
          const Color.fromARGB(255, 231, 237, 255),
        ),
        _createSummaryItem(
          BankIcons.expense,
          "هزینه‌ها",
          3460,
          const Color.fromARGB(255, 255, 130, 172),
          const Color.fromARGB(255, 255, 224, 235),
        ),
        _createSummaryItem(
          BankIcons.totalSave,
          "کل پس اندازها",
          7920,
          const Color.fromARGB(255, 22, 219, 203),
          const Color.fromARGB(255, 220, 250, 248),
        ),
      ],
    );
  }
}
