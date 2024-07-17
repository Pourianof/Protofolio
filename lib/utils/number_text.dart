import 'package:flutter/material.dart';

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
        "${number ?? textNumber}",
        style: style,
      ),
    );
  }
}
