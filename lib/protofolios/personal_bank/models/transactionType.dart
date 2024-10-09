import 'package:flutter/material.dart';

class TransactionType {
  final IconData icon;
  final Color iconColor;
  // final Color iconBackgroundColor;
  final String title;
  TransactionType({
    required this.title,
    required this.icon,
    required this.iconColor,
    // required this.iconBackgroundColor,
  });
}
