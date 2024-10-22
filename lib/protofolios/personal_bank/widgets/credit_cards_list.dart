import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/creadit_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/responsive_layout.dart';
import 'package:my_portfolio/shared/partition_layout/partion_layout_theme.dart';

class CrossWidgetDelegator {
  final List<Widget> labels;
  final Widget box;
  CrossWidgetDelegator({required this.labels, required this.box});
}

class CreditCardsList extends StatelessWidget {
  static const creditsSpaces = 10.0;
  final bool threeCards;
  const CreditCardsList({super.key, this.threeCards = false});

  _getCard(BuildContext context,
      [CreaditCardStyleTheme style = CreaditCardStyleTheme.active]) {
    final card = CreditCard(
      styleTheme: style,
    );
    return ResponsiveLayout.isMobile(context)
        ? card
        : Flexible(flex: 1, child: card);
  }

  @override
  Widget build(BuildContext context) {
    final gap = PartionLayoutTheme.of(context)?.partionItemGap;

    final mainRow = Row(
      mainAxisAlignment: ResponsiveLayout.isMobile(context)
          ? MainAxisAlignment.start
          : MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (threeCards) ...[
          _getCard(context, CreaditCardStyleTheme.highlight),
          SizedBox(
            width: gap ?? 30,
          ),
        ],
        _getCard(context, CreaditCardStyleTheme.active),
        SizedBox(
          width: gap ?? 30,
        ),
        _getCard(context, CreaditCardStyleTheme.inactive),
      ],
    );

    return ResponsiveLayout(
      desktopMode: mainRow,
      mobileMode: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: mainRow,
      ),
    );
  }
}
