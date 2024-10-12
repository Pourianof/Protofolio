import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_styles.dart';

class BankCard extends StatelessWidget {
  final Widget child;
  const BankCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: AppStyles.cardPadding,
        child: child,
      ),
    );
  }
}
