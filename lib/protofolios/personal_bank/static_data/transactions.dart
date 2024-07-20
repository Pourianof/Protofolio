import 'package:my_portfolio/protofolios/personal_bank/models/transaction.dart';

// ignore: non_constant_identifier_names
final TRANSACTIONS = [
  Transaction(
    description: "خرید اشتراک فیلیمو",
    id: "#12345678",
    type: "خرید",
    cardNumber: "1234 ****",
    date: DateTime.now(),
    amount: -400000,
  ),
  Transaction(
    description: "فروش کتاب ها در دیوار",
    id: "#12345678",
    type: "انتقال",
    amount: 150000,
    cardNumber: "1234 ****",
    date: DateTime.now(),
  ),
  Transaction(
    description: "تعمیر موبایل",
    id: "#12345678",
    type: "خدمات",
    amount: -480000,
    cardNumber: "1234 ****",
    date: DateTime.now(),
  ),
  Transaction(
    description: "کارت به کارت به پدر",
    id: "#12345678",
    type: "انتقال",
    amount: -200000,
    cardNumber: "1234 ****",
    date: DateTime.now(),
  ),
  Transaction(
    description: "پرداخت دستمزد مراد",
    id: "#12345678",
    type: "انتقال",
    amount: -600000,
    cardNumber: "1234 ****",
    date: DateTime.now(),
  ),
];
