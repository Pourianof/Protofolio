import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/my_cards/widgets/add_new_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/my_cards/widgets/card_settings.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/my_cards/widgets/cards_list.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/my_cards/widgets/credit_card_statistics.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/creadit_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/credit_cards_list.dart';
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
            PartitionItem(const MediumTitle("کارت های من"), 100, 1),
          ],
        ),
        PartitionRow(
          [
            PartitionItem(
              const CreditCardsList(
                threeCards: true,
              ),
              100,
              1,
            ),
          ],
          height: 235,
        ),
        PartitionRow(
          [
            PartitionItem(const MediumTitle("آمار صورتحساب کارت"), 35, 2),
            PartitionItem(const MediumTitle("لیست کارت ها"), 65, 3),
          ],
        ),
        PartitionRow(
          [
            PartitionItem(const CreditCardStatistics(), 35, 2),
            PartitionItem(const CardsList(), 65, 3),
          ],
          height: 400,
        ),
        PartitionRow(
          [
            PartitionItem(const MediumTitle("افزودن کارت جدید"), 70, 4),
            PartitionItem(const MediumTitle("تنظیمات کارت"), 30, 5),
          ],
        ),
        PartitionRow(
          [
            PartitionItem(const AddNewCard(), 70, 4),
            PartitionItem(const CardSettings(), 30, 5),
          ],
          height: 450,
        )
      ],
    );
  }
}
