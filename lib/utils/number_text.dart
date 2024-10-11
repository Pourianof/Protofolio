import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/helpers/utils.dart';

class NumberText extends StatelessWidget {
  final double? number;
  final String? textNumber;
  final TextStyle? style;
  const NumberText({super.key, this.number, this.textNumber, this.style});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Text(
        "${number != null ? toCommaSeperated(number!) : textNumber}",
        style: style,
      ),
    );
  }
}
