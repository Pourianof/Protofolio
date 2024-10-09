import 'package:my_portfolio/protofolios/personal_bank/models/transactionType.dart';

enum TransactionState {
  pending,
  completed,
}

class Transaction {
  final String description;
  final String id;
  final String cardNumber;
  final DateTime date;
  final double amount;
  final TransactionType type;
  final TransactionState state;

  Transaction({
    required this.description,
    required this.id,
    required this.type,
    required this.cardNumber,
    required this.date,
    required this.amount,
    required this.state,
  });
}
