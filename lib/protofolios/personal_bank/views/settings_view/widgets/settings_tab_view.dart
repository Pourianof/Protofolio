import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_styles.dart';

class SettingsTabView extends StatelessWidget {
  final Widget child;
  const SettingsTabView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppStyles.cardBorderRadiusValue),
        child: Container(
            padding: AppStyles.cardPadding,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(AppStyles.cardBorderRadiusValue),
                bottomLeft: Radius.circular(AppStyles.cardBorderRadiusValue),
              ),
            ),
            child: child),
      ),
    );
  }
}
