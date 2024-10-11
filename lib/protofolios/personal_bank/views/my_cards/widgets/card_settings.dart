import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/icon_link.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';

class CardSettings extends StatelessWidget {
  const CardSettings({super.key});

  _generateCardSettingItem(
    ColoredIcon icon,
    String title,
    String subtitle,
  ) {
    return Row(
      children: [
        IconLink(
          icon: icon,
        ),
        const SizedBox(
          width: 15,
        ),
        SubtitledLabel(title: title, subtitle: subtitle)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BankCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _generateCardSettingItem(
            ColoredIcon(
              color: AppColors.chartYellow,
              icon: BankIcons.creditCard,
            ),
            "مسدود کردن کارت",
            "مسدود کردن فوری کارت",
          ),
          _generateCardSettingItem(
            ColoredIcon(color: AppColors.chartBlue, icon: BankIcons.lock),
            "تغییر پین کد",
            "پین کد جدیدی تنظیم کنید",
          ),
          _generateCardSettingItem(
            ColoredIcon(color: AppColors.pink, icon: BankIcons.googleThin),
            "افزودن به Google Pay",
            "برداشت بدون هیچ کارتی",
          ),
          _generateCardSettingItem(
            ColoredIcon(color: AppColors.chartCyan, icon: BankIcons.appleInc),
            "افزودن به Apple Pay",
            "برداشت بدون هیچ کارتی",
          ),
          _generateCardSettingItem(
            ColoredIcon(color: AppColors.chartCyan, icon: BankIcons.appleInc),
            "افزودن به Apple Store",
            "برداشت بدون هیچ کارتی",
          ),
        ],
      ),
    );
  }
}
