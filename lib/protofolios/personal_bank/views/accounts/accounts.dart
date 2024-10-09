import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/accounts/widgets/IconicLastTransactions.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/accounts/widgets/debit_and_credit_chart.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/accounts/widgets/invoices_sent.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/creadit_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/shared/partition_layout.dart';
import 'package:my_portfolio/utils/number_text.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return PartitionLayout(
      partitions: [
        PartitionRow(
          [
            PartitionItem(AcountSummary(), 100),
          ],
          null,
        ),
        PartitionRow(
          [
            PartitionItem(MediumTitle("آخرین تراکنش ها"), 60),
            PartitionItem(
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MediumTitle("کارت‌های من"),
                  MediumTitle("دیدن همه"),
                ],
              ),
              40,
            ),
          ],
          null,
        ),
        PartitionRow(
          [
            PartitionItem(IconicLastTransactions(), 70),
            PartitionItem(
              const CreditCard(
                styleTheme: CreaditCardStyleTheme.highlight,
              ),
              30,
            )
          ],
          300,
        ),
        PartitionRow([
          PartitionItem(MediumTitle("چشم انداز اعتبار و بدهی"), 60),
          PartitionItem(MediumTitle("صورت حساب"), 40),
        ], null),
        PartitionRow([
          PartitionItem(DebitAndCreditChart(), 70),
          PartitionItem(InvoicesSent(), 30)
        ], 400)
      ],
    );
  }
}

class AcountSummary extends StatelessWidget {
  AcountSummary({super.key});

  late BuildContext _currentContext;

  _createSummaryItem(IconData icon, String title, int amount, Color iconColor,
      Color iconBackgroundColor) {
    return Flexible(
      flex: 1,
      child: BankCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconBackgroundColor,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(_currentContext).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                NumberText(
                  textNumber: "$amount\$",
                  style: Theme.of(_currentContext).textTheme.titleLarge,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _currentContext = context;

    const gap = SizedBox(
      width: 40,
    );

    return Row(
      children: [
        _createSummaryItem(
          BankIcons.balance,
          "موجودی",
          12750,
          const Color.fromARGB(255, 255, 185, 56),
          const Color.fromARGB(255, 255, 245, 217),
        ),
        gap,
        _createSummaryItem(
          BankIcons.income,
          "درآمد",
          5600,
          const Color.fromARGB(255, 57, 107, 255),
          const Color.fromARGB(255, 231, 237, 255),
        ),
        gap,
        _createSummaryItem(
          BankIcons.expense,
          "هزینه‌ها",
          3460,
          const Color.fromARGB(255, 255, 130, 172),
          const Color.fromARGB(255, 255, 224, 235),
        ),
        gap,
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
