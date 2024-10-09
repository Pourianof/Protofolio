import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';

class IconLink extends StatelessWidget {
  final ColoredIcon icon;
  const IconLink({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: icon.color.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        icon.icon,
        size: 27,
        color: icon.color,
      ),
    );
  }
}
