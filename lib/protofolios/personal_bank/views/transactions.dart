import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/credit_cards_list.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/expenses_chart.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/last_transactions.dart';
import 'package:my_portfolio/shared/partition_layout/partition_layout.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return PartitionLayout(
      partitions: [
        PartitionRow(
          [
            PartitionItem(
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MediumTitle("کارت های من"),
                  MediumTitle("+ افزودن کارت"),
                ],
              ),
              70,
              1,
            ),
            PartitionItem(
              const MediumTitle("خرج های من"),
              30,
              2,
            ),
          ],
        ),
        PartitionRow(
          [
            PartitionItem(
              const CreditCardsList(),
              70,
              1,
            ),
            PartitionItem(
              const ExpensesChart(),
              30,
              2,
            )
          ],
          height: 235,
        ),
        PartitionRow(
          [
            PartitionItem(
              const MediumTitle("تراکنش های اخیر"),
              100,
              3,
            ),
          ],
        ),
        PartitionRow(
          [
            PartitionItem(
              const LastTransactions(),
              100,
              3,
            ),
          ],
        ),
      ],
    );
  }
}
