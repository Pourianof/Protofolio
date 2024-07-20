import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/static_data/transactions.dart';
import 'package:my_portfolio/shared/custom_data_table.dart';

class LastTransactions extends StatefulWidget {
  const LastTransactions({super.key});

  @override
  State<LastTransactions> createState() => _LastTransactionsState();
}

class _LastTransactionsState extends State<LastTransactions> {
  @override
  Widget build(BuildContext context) {
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
                      child: const Text("تمام تراکنش ها"),
                    ),
                    Container(
                      width: 150,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: const Text("درآمد ها"),
                    ),
                    Container(
                      width: 150,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: const Text("خرجی ها"),
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
                ),
                dividerGenerator: (index) {
                  if (index == 0) {
                    return const BorderSide(
                      color: AppColors.mainLightGrey,
                      width: 1,
                    );
                  }
                  return const BorderSide(
                    color: AppColors.mainLightGrey_100,
                    width: 1,
                  );
                },
                rows: [
                  CustomDataTableRow(
                    cells: [
                      CustomDataCell(
                        data: const Text(
                          'توضیحات',
                          // style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      CustomDataCell(
                        data: const Text(
                          'شناسه',
                          // style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      CustomDataCell(
                        data: const Text(
                          'نوع',
                          // style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      CustomDataCell(
                        data: const Text(
                          'شماره کارت',
                          // style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      CustomDataCell(
                        data: const Text(
                          'تاریخ',
                          // style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      CustomDataCell(
                        data: const Text(
                          'مقدار',
                          // style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      CustomDataCell(
                        data: const Text(
                          'رسید',
                          // style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                  ...TRANSACTIONS.map((trx) {
                    return CustomDataTableRow(cells: [
                      CustomDataCell(
                        data: Text(
                          trx.description,
                        ),
                      ),
                      CustomDataCell(data: Text(trx.id)),
                      CustomDataCell(data: Text(trx.type)),
                      CustomDataCell(data: Text(trx.cardNumber)),
                      CustomDataCell(data: Text(trx.date.toIso8601String())),
                      CustomDataCell(
                        data: Text(
                          trx.amount.toString(),
                        ),
                      ),
                      CustomDataCell(
                        data: const Text("دانلود"),
                      ),
                    ]);
                  }),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
