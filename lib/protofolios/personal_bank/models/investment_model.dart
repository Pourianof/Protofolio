import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';

class InvestmentModel {
  final String stockTitle;
  final String stockType;
  final double investValue;
  final double returnValue;
  final ColoredIcon icon;
  InvestmentModel({
    required this.stockTitle,
    required this.stockType,
    required this.investValue,
    required this.returnValue,
    required this.icon,
  });
}
