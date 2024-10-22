import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/helpers/utils.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/static_data/loans.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/responsive_layout.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/shared/custom_data_table.dart';
import 'package:my_portfolio/utils/number_text.dart';

class ActiveLoansOverview extends StatelessWidget {
  const ActiveLoansOverview({super.key});

  provideTableTitle(title) {
    return CustomDataCell(
      data: NonActiveLink(title),
    );
  }

  provideTotalLabel(String val) {
    return CustomDataCell(
      data: Text(
        val,
        style: TextStyle(color: AppColors.red),
      ),
    );
  }

  provideEmptyCell() {
    return CustomDataCell(data: Container());
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    List<CustomDataTableRow> loanWidgets = [];
    double totalMoney = 0;
    double totalLeft = 0;
    double totalInstallment = 0;

    for (var idx = 0; idx < LOANS.length; idx++) {
      var loan = LOANS[idx];
      totalMoney += loan.money;
      totalLeft += loan.left;
      totalInstallment += loan.installment;

      loanWidgets.add(
        CustomDataTableRow(
          cells: [
            if (!isMobile)
              CustomDataCell(
                data: NumberText(
                  textNumber: "0${idx + 1}.",
                ),
              ),
            CustomDataCell(
              data: NumberText(textNumber: "${toCommaSeperated(loan.money)}T"),
            ),
            CustomDataCell(
              data: NumberText(textNumber: "${toCommaSeperated(loan.left)}T"),
            ),
            if (!isMobile) ...[
              CustomDataCell(
                data: Text("${loan.duration} ماه"),
              ),
              CustomDataCell(
                data: NumberText(textNumber: "${loan.rate}%"),
              ),
              CustomDataCell(
                data: Text("${toCommaSeperated(loan.installment)}/ماه"),
              ),
            ],
            CustomDataCell(
              data: OutlinedButton(
                onPressed: () {},
                child: Text("بازپرداخت"),
              ),
            ),
          ],
        ),
      );
    }

    const border = BorderSide(color: AppColors.borderColor, width: 1);
    return BankCard(
      child: CustomDataTable(
        configs: CustomDataTableConfig(
          cellsAllignment: Alignment.centerRight,
          rowPaddings: const EdgeInsets.symmetric(vertical: 15),
        ),
        dividerGenerator: (index) => index == 0
            ? border
            : index == LOANS.length
                ? border
                : index < LOANS.length
                    ? const BorderSide(
                        color: AppColors.mainLightGrey_100, width: 1)
                    : null,
        rows: [
          CustomDataTableRow(
            cells: [
              if (!isMobile) provideTableTitle("شماره"),
              provideTableTitle("مبلغ وام"),
              provideTableTitle("باقی مانده"),
              if (!isMobile) ...[
                provideTableTitle("بازه"),
                provideTableTitle("نرخ سود"),
                provideTableTitle("قسط"),
              ],
              provideTableTitle("بازپرداخت"),
            ],
          ),
          ...loanWidgets,
          CustomDataTableRow(cells: [
            if (!isMobile) provideTotalLabel("کل"),
            provideTotalLabel("${toCommaSeperated(totalMoney)}T"),
            provideTotalLabel("${toCommaSeperated(totalLeft)}T"),
            if (!isMobile) ...[
              provideEmptyCell(),
              provideEmptyCell(),
            ],
            provideTotalLabel("${toCommaSeperated(totalInstallment)}T/ماه"),
            if (!isMobile) provideEmptyCell(),
          ])
        ],
      ),
    );
  }
}
