import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/my_cards/widgets/add_new_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/my_cards/widgets/card_settings.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/my_cards/widgets/cards_list.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/my_cards/widgets/credit_card_statistics.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/creadit_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/shared/partition_layout/partition_layout.dart';

class MyCards extends StatelessWidget {
  const MyCards({super.key});

  @override
  Widget build(BuildContext context) {
    const padd = SizedBox(
      width: 30,
    );
    return PartitionLayout(
      partitions: [
        PartitionRow(
          [
            PartitionItem(const MediumTitle("کارت های من"), 100),
          ],
        ),
        PartitionRow(
          [
            PartitionItem(
              const Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: CreditCard(
                      styleTheme: CreaditCardStyleTheme.highlight,
                    ),
                  ),
                  padd,
                  Expanded(
                    child: CreditCard(
                      styleTheme: CreaditCardStyleTheme.active,
                    ),
                  ),
                  padd,
                  Expanded(
                    child: CreditCard(
                      styleTheme: CreaditCardStyleTheme.inactive,
                    ),
                  )
                ],
              ),
              100,
            ),
          ],
          height: 300,
        ),
        PartitionRow(
          [
            PartitionItem(const MediumTitle("آمار صورتحساب کارت"), 35),
            PartitionItem(const MediumTitle("لیست کارت ها"), 65),
          ],
        ),
        PartitionRow(
          [
            PartitionItem(const CreditCardStatistics(), 35),
            PartitionItem(const CardsList(), 65),
          ],
          height: 400,
        ),
        PartitionRow(
          [
            PartitionItem(const MediumTitle("افزودن کارت جدید"), 75),
            PartitionItem(const MediumTitle("تنظیمات کارت"), 25),
          ],
        ),
        PartitionRow(
          [
            PartitionItem(const AddNewCard(), 75),
            PartitionItem(const CardSettings(), 25),
          ],
          height: 450,
        )
      ],
    );
  }
}
