import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/helpers/utils.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/amount_text.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/shared/custom_data_table.dart';
import 'package:my_portfolio/protofolios/personal_bank/static_data/stocks.dart';
import 'package:my_portfolio/utils/number_text.dart';

class TrendingStocks extends StatelessWidget {
  const TrendingStocks({super.key});

  @override
  Widget build(BuildContext context) {
    return BankCard(
      child: CustomDataTable(
        dividerGenerator: (index) => index == 0
            ? BorderSide(
                color: AppColors.mainLightGrey_100,
                width: 1,
              )
            : null,
        configs: CustomDataTableConfig(
          cellsPadding: EdgeInsets.symmetric(horizontal: 10),
          cellsAllignment: Alignment.centerRight,
          rowPaddings: const EdgeInsets.symmetric(vertical: 15),
        ),
        rows: [
          const CustomDataTableRow(
            cells: [
              CustomDataCell(
                data: NonActiveLink("شماره"),
              ),
              CustomDataCell(
                data: NonActiveLink("نام"),
              ),
              CustomDataCell(
                data: NonActiveLink("قیمت"),
              ),
              CustomDataCell(
                data: NonActiveLink("بازگشت"),
              ),
            ],
          ),
          ...STOCKS.indexed.map(
            (e) {
              final (idx, stck) = e;
              return CustomDataTableRow(
                cells: [
                  CustomDataCell(
                    data: Text("0${idx + 1}."),
                  ),
                  CustomDataCell(
                    data: Text(stck.name),
                  ),
                  CustomDataCell(
                    data: Text(
                      "${toCommaSeperated(stck.price)} تومان",
                    ),
                  ),
                  CustomDataCell(
                    data: AmountText(
                      amount: stck.returnRate,
                      suffix: '%',
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
