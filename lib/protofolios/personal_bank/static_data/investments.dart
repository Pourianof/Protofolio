import 'dart:ui';

import 'package:my_portfolio/protofolios/personal_bank/models/colored_icon.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/investment_model.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';

final INVESTMENTS = [
  InvestmentModel(
    investValue: 54000000,
    returnValue: 16,
    stockTitle: 'فروشگاه اپل',
    stockType: 'بازار, تجارت الکترونیک',
    icon: ColoredIcon(
      color: const Color.fromARGB(255, 255, 130, 172),
      icon: BankIcons.appleIncFill,
    ),
  ),
  InvestmentModel(
    investValue: 25300000,
    returnValue: -4,
    stockTitle: 'موبایل GLX',
    stockType: 'بازار, تجارت الکترونیک',
    icon: ColoredIcon(
      color: const Color.fromARGB(255, 68, 112, 255),
      icon: BankIcons.appleIncFill,
    ),
  ),
  InvestmentModel(
    investValue: 54000000,
    returnValue: 16,
    stockTitle: 'ایران خودرو',
    stockType: 'خودروهای الکتریکی',
    icon: ColoredIcon(
      color: const Color.fromARGB(255, 255, 185, 56),
      icon: BankIcons.teslaInc,
    ),
  ),
];
