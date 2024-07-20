import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/credit_cards_list.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/expenses_chart.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/last_transactions.dart';
import 'package:my_portfolio/shared/partition_layout.dart';
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
              75,
            ),
            PartitionItem(
              const MediumTitle("خرج های من"),
              25,
            ),
          ],
          null,
        ),
        PartitionRow(
          [
            PartitionItem(
              const CreditCardsList(),
              75,
            ),
            PartitionItem(
              const ExpensesChart(),
              25,
            )
          ],
          300,
        ),
        PartitionRow(
          [
            PartitionItem(
              const MediumTitle("تراکنش های اخیر"),
              100,
            ),
          ],
          null,
        ),
        PartitionRow(
          [
            PartitionItem(
              const LastTransactions(),
              100,
            ),
          ],
          null,
        ),
      ],
    );
  }
}
