import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/transaction.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/transactionType.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';

final Map<String, TransactionType> TRANSACTION_TYPES = {
  "buy_sub": TransactionType(
    icon: BankIcons.reNew,
    // iconBackgroundColor: Color.fromARGB(255, 22, 219, 203).withOpacity(0.3),
    iconColor: const Color.fromARGB(255, 22, 219, 203),
    title: "خرید",
  ),
  "send": TransactionType(
    icon: BankIcons.user,
    // iconBackgroundColor: Colors.red,
    iconColor: const Color.fromARGB(255, 255, 130, 172),
    title: "انتقال",
  ),
  "service": TransactionType(
    icon: BankIcons.settings,
    // iconBackgroundColor: Colors.red,
    iconColor: const Color.fromARGB(255, 57, 107, 255),
    title: "خدمات",
  ),
};

// ignore: non_constant_identifier_names
final TRANSACTIONS = [
  Transaction(
      description: "خرید اشتراک فیلیمو",
      id: "#12345678",
      type: TRANSACTION_TYPES["buy_sub"]!,
      cardNumber: "1234 ****",
      date: DateTime.now(),
      amount: -400000,
      state: TransactionState.pending),
  Transaction(
      description: "تعمیر موبایل",
      id: "#12345678",
      type: TRANSACTION_TYPES["service"]!,
      amount: -480000,
      cardNumber: "1234 ****",
      date: DateTime.now(),
      state: TransactionState.completed),
  Transaction(
      description: "پرداخت دستمزد مراد اکبری",
      id: "#12345678",
      type: TRANSACTION_TYPES["send"]!,
      amount: 600000,
      cardNumber: "1234 ****",
      date: DateTime.now(),
      state: TransactionState.completed),
  Transaction(
      description: "کارت به کارت به پدر",
      id: "#12345678",
      type: TRANSACTION_TYPES["send"]!,
      amount: -200000,
      cardNumber: "1234 ****",
      date: DateTime.now(),
      state: TransactionState.pending),
  Transaction(
    description: "فروش کتاب ها در دیوار",
    id: "#12345678",
    type: TRANSACTION_TYPES["send"]!,
    amount: 150000,
    cardNumber: "1234 ****",
    date: DateTime.now(),
    state: TransactionState.completed,
  ),
];
