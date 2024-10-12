import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/investments/widgets/investments_list.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/investments/widgets/investments_summary.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/investments/widgets/monthly_revenue.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/investments/widgets/trending_stocks.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/investments/widgets/yearly_total_investment.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/shared/partition_layout/partition_layout.dart';

class Investments extends StatelessWidget {
  const Investments({super.key});

  @override
  Widget build(BuildContext context) {
    return PartitionLayout(
      partitions: [
        PartitionRow(
          [PartitionItem(InvestmentsSummary(), 100)],
        ),
        PartitionRow(
          [
            PartitionItem(const MediumTitle("کل سرمایه گذاری سالانه"), 50),
            PartitionItem(const MediumTitle("درآمد ماهانه"), 50)
          ],
        ),
        PartitionRow(
          [
            PartitionItem(const YearlyTotalInvestment(), 50),
            PartitionItem(const MonthlyRevenue(), 50)
          ],
          height: 400,
        ),
        PartitionRow(
          [
            PartitionItem(const MediumTitle("سرمایه گذاری"), 65),
            PartitionItem(const MediumTitle("سهام های محبوب"), 35)
          ],
        ),
        PartitionRow(
          [
            PartitionItem(const InvestmentsList(), 65),
            PartitionItem(const TrendingStocks(), 35),
          ],
        )
      ],
    );
  }
}
