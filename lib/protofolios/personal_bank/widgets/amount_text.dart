import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/number_text.dart';

class AmountText extends StatelessWidget {
  final double amount;
  const AmountText({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return NumberText(
      style: TextStyle(
        color: amount > 0 ? Colors.green : Colors.red,
        fontWeight: FontWeight.bold,
      ),
      textNumber: "${amount.sign > 0 ? "+" : "-"}\$${amount.abs()}",
    );
  }
}
