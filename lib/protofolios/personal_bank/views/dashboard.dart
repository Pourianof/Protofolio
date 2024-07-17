import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/credit_cards_list.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          makeARow(
            75,
            25,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("کارت های من"),
                Text("دیدن همه"),
              ],
            ),
            const Text("تراکنش های اخیر"),
            null,
          ),
          makeARow(75, 25, CreditCardsList(), TransactionsBox(), 300),
          makeARow(
            75,
            25,
            const Text("فعالیت هفتگی"),
            const Text("آمار خرجی"),
            null,
          ),
          makeARow(75, 25, ActivityBarChart(), const ExpensesStatistics(), 400),
          makeARow(
            35,
            65,
            const Text("انتقال سریع"),
            const Text("تاریخچه موجودی"),
            null,
          ),
          makeARow(35, 65, QuickTransferCard(), BalanceHistoryChartCard(), 350),
        ],
      ),
    );
  }
}
