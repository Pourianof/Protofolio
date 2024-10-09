import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/creadit_card.dart';

class CrossWidgetDelegator {
  final List<Widget> labels;
  final Widget box;
  CrossWidgetDelegator({required this.labels, required this.box});
}

class CreditCardsList extends StatelessWidget {
  static const creditsSpaces = 10.0;
  const CreditCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          flex: 50,
          fit: FlexFit.tight,
          child: CreditCard(
            styleTheme: CreaditCardStyleTheme.active,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Flexible(
          flex: 50,
          fit: FlexFit.tight,
          child: CreditCard(),
        )
      ],
    );
  }
}
