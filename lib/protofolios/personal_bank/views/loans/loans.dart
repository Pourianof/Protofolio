import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/helpers/utils.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/loans/widgets/active_loans_overview.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/summary_item.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/summary_wrapper.dart';
import 'package:my_portfolio/shared/partition_layout/partition_layout.dart';

class Loans extends StatelessWidget {
  const Loans({super.key});

  @override
  Widget build(BuildContext context) {
    return PartitionLayout(
      partitions: [
        PartitionRow(
          [
            PartitionItem(
              LoansSummary(),
              100,
            ),
          ],
        ),
        PartitionRow(
          [PartitionItem(MediumTitle("نگاه کلی به وام های فعال"), 100)],
        ),
        PartitionRow([
          PartitionItem(
            ActiveLoansOverview(),
            100,
          ),
        ])
      ],
    );
  }
}

class LoansSummary extends StatelessWidget {
  const LoansSummary({
    super.key,
  });

  _getSummary(String amount, String title, ColoredIcon icon) {
    return SummaryItem(
      amount: amount,
      title: title,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SummaryWrapper(items: [
      _getSummary(
        "${toCommaSeperated(50000000)}T",
        "وام های شخصی",
        ColoredIcon(
          color: AppColors.darkBlue,
          icon: BankIcons.account,
        ),
      ),
      _getSummary(
        "${toCommaSeperated(100000000)}T",
        "وام های ضمانت شده",
        ColoredIcon(
          color: AppColors.chartYellow,
          icon: BankIcons.moneyBag,
        ),
      ),
      _getSummary(
        "${toCommaSeperated(500000000)}T",
        "وام های تجاری",
        ColoredIcon(
          color: AppColors.pink,
          icon: BankIcons.graph,
        ),
      ),
      _getSummary(
        "وام بگیرید",
        "وام های شخصی",
        ColoredIcon(
          color: AppColors.chartCyan,
          icon: BankIcons.services,
        ),
      ),
    ]);
  }
}
