import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/icon_link.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/responsive_layout.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';

class CardsList extends StatelessWidget {
  const CardsList({super.key});

  _provideCardRow(Color color, String bank, String name, bool isMobile) {
    return BankCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 15,
            children: [
              IconLink(
                icon: ColoredIcon(color: color, icon: BankIcons.creditCard),
              ),
              const SubtitledLabel(title: "نوع کارت", subtitle: "جانبی"),
            ],
          ),
          SubtitledLabel(title: "بانک", subtitle: "بانک $bank"),
          if (!isMobile)
            const SubtitledLabel(
                title: "شماره کارت", subtitle: "6037 *** *** 5823"),
          SubtitledLabel(title: "به نام", subtitle: name),
          const ActiveLink("دیدن جزئیات"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _provideCardRow(AppColors.chartYellow, "صادرات", 'کریم', isMobile),
      _provideCardRow(AppColors.pink, "ملی", 'الناز', isMobile),
      _provideCardRow(AppColors.chartBlue, "ملت", 'فیونا', isMobile),
    ]);
  }
}
