import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/credit_cards_list.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/shared/partition_layout/partition_layout.dart';
import '../widgets/transaction_box.dart';
import '../widgets/activity_bar_chart.dart';
import '../widgets/expenses_statistics.dart';
import '../widgets/quick_transfer_card.dart';
import '../widgets/balance_history_chart_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  Widget makeARow(
    int firstFlex,
    int secondFlex,
    Widget firstChild,
    Widget secondWidget,
    double? height,
  ) {
    return Container(
      height: height,
      padding: const EdgeInsets.only(
        bottom: 0,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: firstFlex,
            child: firstChild,
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: secondFlex,
            child: secondWidget,
          )
        ],
      ),
    );
  }

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
                  MediumTitle("دیدن همه"),
                ],
              ),
              75,
              1,
            ),
            PartitionItem(
              const MediumTitle("تراکنش های اخیر"),
              25,
              2,
            ),
          ],
        ),
        PartitionRow(
          [
            PartitionItem(const CreditCardsList(), 75, 1),
            PartitionItem(const TransactionsBox(), 25, 2)
          ],
          height: 235,
        ),
        PartitionRow(
          [
            PartitionItem(const MediumTitle("فعالیت هفتگی"), 75, 3),
            PartitionItem(const MediumTitle("تاریخچه موجودی"), 25, 4),
          ],
        ),
        PartitionRow(
          [
            PartitionItem(ActivityBarChart(), 75, 3),
            PartitionItem(const ExpensesStatistics(), 25, 4),
          ],
          height: 400,
        ),
        PartitionRow(
          [
            PartitionItem(const MediumTitle("انتقال سریع"), 35, 5),
            PartitionItem(const MediumTitle("تاریخچه موجودی"), 65, 6),
          ],
        ),
        PartitionRow(
          [
            PartitionItem(QuickTransferCard(), 35, 5),
            PartitionItem(BalanceHistoryChartCard(), 65, 6),
          ],
          height: 350,
        ),
      ],
    );
  }
}
