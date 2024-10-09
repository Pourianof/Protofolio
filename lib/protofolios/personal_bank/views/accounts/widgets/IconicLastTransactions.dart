import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/transaction.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/accounts/widgets/icon_link.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/amount_text.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/shared/custom_data_table.dart';
import 'package:my_portfolio/protofolios/personal_bank/static_data/transactions.dart';

class IconicLastTransactions extends StatelessWidget {
  const IconicLastTransactions({super.key});

  _evalTrxState(TransactionState state) {
    return state == TransactionState.pending ? "در انتظار" : 'کامل شده';
  }

  @override
  Widget build(BuildContext context) {
    return BankCard(
      child: CustomDataTable(
        configs: CustomDataTableConfig(
          cellsAllignment: Alignment.centerRight,
          rowPaddings: EdgeInsets.all(5),
        ),
        rows: TRANSACTIONS.sublist(0, 3).map((trx) {
          final type = trx.type;
          return CustomDataTableRow(
            cells: [
              CustomDataCell(
                data: Row(
                  children: [
                    IconLink(
                      icon: ColoredIcon(
                        icon: type.icon,
                        color: type.iconColor,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Wrap(
                      direction: Axis.vertical,
                      children: [
                        Text(
                          trx.description,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        NonActiveLink(trx.date.toString())
                      ],
                    ),
                  ],
                ),
              ),
              CustomDataCell(
                alignment: Alignment.center,
                data: NonActiveLink(type.title),
              ),
              CustomDataCell(
                alignment: Alignment.center,
                data: NonActiveLink(_evalTrxState(trx.state)),
              ),
              CustomDataCell(
                alignment: Alignment.center,
                data: AmountText(amount: trx.amount),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
