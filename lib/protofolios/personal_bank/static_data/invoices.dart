import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/invoice.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';

final List<Invoice> INVOICES = [
  Invoice(
    icon: ColoredIcon(
      color: const Color.fromARGB(255, 22, 219, 203),
      icon: BankIcons.appleInc,
    ),
    reciver: "Apple",
    amount: 450,
    date: "5 ساعت پیش",
  ),
  Invoice(
    icon: ColoredIcon(
      color: const Color.fromARGB(255, 255, 185, 56),
      icon: BankIcons.user,
    ),
    reciver: "نرگس",
    amount: 160,
    date: "2 روز پیش",
  ),
  Invoice(
    icon: ColoredIcon(
      color: const Color.fromARGB(255, 57, 107, 255),
      icon: BankIcons.playStationInc,
    ),
    reciver: "Playstation",
    amount: 1085,
    date: "5 روز پیش",
  ),
  Invoice(
    icon: ColoredIcon(
      color: const Color.fromARGB(255, 255, 130, 172),
      icon: BankIcons.user,
    ),
    reciver: "غلام",
    amount: 90,
    date: "10 روز پیش",
  ),
];
