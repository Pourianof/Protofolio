import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';

class Invoice {
  final String reciver;
  final ColoredIcon icon;
  final int amount;
  final String date;
  Invoice({
    required this.reciver,
    required this.icon,
    required this.amount,
    required this.date,
  });
}
