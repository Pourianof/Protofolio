class Transaction {
  final String description;
  final String id;
  final String type;
  final String cardNumber;
  final DateTime date;
  final double amount;

  Transaction({
    required this.description,
    required this.id,
    required this.type,
    required this.cardNumber,
    required this.date,
    required this.amount,
  });
}
