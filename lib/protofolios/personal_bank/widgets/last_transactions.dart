import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/static_data/transactions.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/shared/custom_data_table.dart';
import 'package:my_portfolio/utils/number_text.dart';

class LastTransactions extends StatefulWidget {
  const LastTransactions({super.key});

  @override
  State<LastTransactions> createState() => _LastTransactionsState();
}

class _LastTransactionsState extends State<LastTransactions> {
  @override
  Widget build(BuildContext context) {
    const headStyle = TextStyle(
      color: AppColors.mainLightGrey,
      fontSize: 16,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 40,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 1,
                  color: AppColors.mainLightGrey_100,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 3,
                            style: BorderStyle.solid,
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ),
                      child: const ActiveLink("تمام تراکنش ها"),
                    ),
                    Container(
                      width: 150,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: const NonActiveLink("درآمد ها"),
                    ),
                    Container(
                      width: 150,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: const NonActiveLink("خرجی ها"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerTheme: DividerThemeData(color: Colors.red),
              ),
              child: CustomDataTable(
                configs: CustomDataTableConfig(
                  rowPaddings: EdgeInsets.all(10),
                  cellsAllignment: Alignment.centerRight,
                ),
                dividerGenerator: (index) {
                  if (index == 0) {
                    return const BorderSide(
                      color: AppColors.mainLightGrey,
                      width: 1,
                    );
                  } else if (index == TRANSACTIONS.length) {
                    return null;
                  }
                  return const BorderSide(
                    color: AppColors.mainLightGrey_100,
                    width: 1,
                  );
                },
                rows: [
                  const CustomDataTableRow(
                    cells: [
                      CustomDataCell(
                        data: const Text(
                          'توضیحات',
                          style: headStyle,
                        ),
                      ),
                      CustomDataCell(
                        data: const Text(
                          'شناسه',
                          style: headStyle,
                        ),
                      ),
                      CustomDataCell(
                        data: const Text(
                          'نوع',
                          style: headStyle,
                        ),
                      ),
                      CustomDataCell(
                        data: const Text(
                          'شماره کارت',
                          style: headStyle,
                        ),
                      ),
                      CustomDataCell(
                        data: const Text(
                          'تاریخ',
                          style: headStyle,
                        ),
                      ),
                      CustomDataCell(
                        data: const Text(
                          'مقدار',
                          style: headStyle,
                        ),
                      ),
                      CustomDataCell(
                        data: const Text(
                          'رسید',
                          style: headStyle,
                        ),
                      ),
                    ],
                  ),
                  ...TRANSACTIONS.map((trx) {
                    return CustomDataTableRow(cells: [
                      CustomDataCell(
                        data: Row(
                          children: [
                            Icon(
                              trx.amount > 0
                                  ? Icons.arrow_circle_down_rounded
                                  : Icons.arrow_circle_up_rounded,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              trx.description,
                            ),
                          ],
                        ),
                      ),
                      CustomDataCell(data: Text(trx.id)),
                      CustomDataCell(data: Text(trx.type)),
                      CustomDataCell(
                          data: NumberText(textNumber: trx.cardNumber)),
                      CustomDataCell(data: Text(trx.date.toIso8601String())),
                      CustomDataCell(
                        data: NumberText(
                          style: TextStyle(
                            color: trx.amount > 0 ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textNumber:
                              "${trx.amount.sign > 0 ? "+" : "-"}\$${trx.amount.abs()}",
                        ),
                      ),
                      CustomDataCell(
                        data: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: AppColors.navi_blue, width: 1),
                          ),
                          child: const Text(
                            "دانلود",
                            style: TextStyle(
                              color: AppColors.navi_blue,
                            ),
                          ),
                        ),
                      ),
                    ]);
                  }),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Row(
            children: [
              const ActiveLink("< قبل"),
              const SizedBox(
                width: 5,
              ),
              ...List.generate(
                4,
                (index) => Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: index == 0 ? AppColors.darkBlue : Colors.transparent,
                  ),
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                        color: index != 0 ? AppColors.darkBlue : Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              ActiveLink("بعد >"),
            ],
          ),
        ),
      ],
    );
  }
}
