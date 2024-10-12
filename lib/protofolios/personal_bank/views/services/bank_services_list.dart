import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_styles.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/icon_link.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';

class BankServicesList extends StatelessWidget {
  const BankServicesList({super.key});

  generateTableCell(Widget child) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(padding: AppStyles.tableRowPadding, child: child),
    );
  }

  generateTableRow(
    ColoredIcon icon,
    String title,
  ) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppStyles.tableRowBorderRadius,
      ),
      children: [
        generateTableCell(
          Row(
            children: [
              IconLink(
                icon: icon,
              ),
              const SizedBox(
                width: 15,
              ),
              SubtitledLabel(
                title: title,
                subtitle: "یک تفاوق بلند مدت",
              ),
            ],
          ),
        ),
        generateTableCell(
          const SubtitledLabel(
            title: "یه متن بی معنی",
            subtitle: "انتشارات به تعداد زیاد",
          ),
        ),
        generateTableCell(
          const SubtitledLabel(
            title: "یه متن بی معنی",
            subtitle: "انتشارات به تعداد زیاد",
          ),
        ),
        generateTableCell(
          const SubtitledLabel(
            title: "یه متن بی معنی",
            subtitle: "انتشارات به تعداد زیاد",
          ),
        ),
        generateTableCell(
          OutlinedButton(
            onPressed: () {},
            child: Text("دیدن جزئیات"),
          ),
        ),
      ],
    );
  }

  generateRowSpacer() {
    return TableRow(
      children: [
        const SizedBox(
          height: 20,
        ),
        ...List.generate(4, (_) => Container())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      children: [
        generateTableRow(
          ColoredIcon(color: AppColors.pink, icon: BankIcons.income),
          "وام های تجاری",
        ),
        generateRowSpacer(),
        generateTableRow(
          ColoredIcon(color: AppColors.chartYellow, icon: BankIcons.manBag),
          "بررسی حساب ها",
        ),
        generateRowSpacer(),
        generateTableRow(
          ColoredIcon(color: AppColors.pink, icon: BankIcons.pieChart),
          "ذخیره حساب‌ها",
        ),
        generateRowSpacer(),
        generateTableRow(
          ColoredIcon(color: AppColors.chartBlue, icon: BankIcons.user),
          "کارت های اعتباری و حساب ها",
        ),
        generateRowSpacer(),
        generateTableRow(
          ColoredIcon(color: AppColors.chartCyan, icon: BankIcons.safe),
          "بیمه عمر",
        ),
        generateRowSpacer(),
        generateTableRow(
          ColoredIcon(color: AppColors.pink, icon: BankIcons.income),
          "وام های تجاری",
        ),
      ],
    );
  }
}
