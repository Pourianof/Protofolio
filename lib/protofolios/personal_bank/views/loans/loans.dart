import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/helpers/utils.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/loans/widgets/active_loans_overview.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/summary_item.dart';
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
              SummaryItem(
                amount: "${toCommaSeperated(50000000)}T",
                title: "وام های شخصی",
                icon: ColoredIcon(
                  color: AppColors.chartBlue,
                  icon: BankIcons.user,
                ),
              ),
              25,
            ),
            PartitionItem(
              SummaryItem(
                amount: "${toCommaSeperated(100000000)}T",
                title: "وام های ضمانت شده",
                icon: ColoredIcon(
                  color: AppColors.chartYellow,
                  icon: BankIcons.moneyBag,
                ),
              ),
              25,
            ),
            PartitionItem(
              SummaryItem(
                amount: "${toCommaSeperated(500000000)}T",
                title: "وام های تجاری",
                icon: ColoredIcon(
                  color: AppColors.pink,
                  icon: BankIcons.graph,
                ),
              ),
              25,
            ),
            PartitionItem(
              SummaryItem(
                amount: "وام بگیرید",
                title: "وام های شخصی",
                icon: ColoredIcon(
                  color: AppColors.chartCyan,
                  icon: BankIcons.services,
                ),
              ),
              25,
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
