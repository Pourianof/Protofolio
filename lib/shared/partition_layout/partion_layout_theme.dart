import 'package:flutter/material.dart';

class PartionLayoutTheme {
  final EdgeInsets? rowInsets;
  final double? partionItemGap;
  factory PartionLayoutTheme({EdgeInsets? rowInsets, double? partionItemGap}) {
    return PartionLayoutTheme.raw(
      partionItemGap: 40,
      rowInsets: rowInsets ??
          const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
    );
  }

  PartionLayoutTheme.raw(
      {required this.partionItemGap, required this.rowInsets});
}
