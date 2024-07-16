import 'package:flutter/material.dart';

class NumberText extends StatelessWidget {
  final double? number;
  final String? textNumber;
  const NumberText({super.key, this.number, this.textNumber});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Text("${number ?? textNumber}"));
  }
}
