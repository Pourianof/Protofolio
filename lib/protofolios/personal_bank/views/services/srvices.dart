import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/services/bank_services_list.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/summary_item.dart';
import 'package:my_portfolio/shared/partition_layout/partition_layout.dart';

class Srvices extends StatelessWidget {
  const Srvices({super.key});

  generateServiceItem(ColoredIcon icon, String title, String subtitle) {
    return PartitionItem(
      SummaryItem(
        title: subtitle,
        subtitle: title,
        icon: icon,
        titleReverseOrder: true,
      ),
      100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PartitionLayout(
      partitions: [
        PartitionRow(
          [
            generateServiceItem(
              ColoredIcon(
                  color: AppColors.chartBlue, icon: BankIcons.insurance),
              "بیمه عمر",
              "ایمنی بی انتها",
            ),
            generateServiceItem(
              ColoredIcon(color: AppColors.chartYellow, icon: BankIcons.bag),
              "خرید",
              "خرید. تفکر. رشد",
            ),
            generateServiceItem(
              ColoredIcon(color: AppColors.chartCyan, icon: BankIcons.safe),
              "ایمنی",
              "ما متحد شما هستیم",
            ),
          ],
        ),
        PartitionRow(
          [PartitionItem(const MediumTitle("لیست خدمات بانکی"), 100)],
        ),
        PartitionRow(
          [
            PartitionItem(
              const BankServicesList(),
              100,
            ),
          ],
        ),
      ],
    );
  }
}
