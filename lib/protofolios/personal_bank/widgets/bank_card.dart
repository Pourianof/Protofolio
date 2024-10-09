import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  final Widget child;
  const BankCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 25),
        child: child,
      ),
    );
  }
}
