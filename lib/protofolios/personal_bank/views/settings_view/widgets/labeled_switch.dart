import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';

class LabeledSwitch extends StatelessWidget {
  final bool currentState;
  final void Function(bool val) onChange;
  final String label;
  const LabeledSwitch({
    super.key,
    required this.currentState,
    required this.label,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          inactiveTrackColor: AppColors.switchInactiveColor,
          value: currentState,
          onChanged: onChange,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(label),
      ],
    );
  }
}
