import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/creadit_card.dart';

class CrossWidgetDelegator {
  final List<Widget> labels;
  final Widget box;
  CrossWidgetDelegator({required this.labels, required this.box});
}

class CreditCardsList extends StatelessWidget {
  static const creditsSpaces = 10.0;
  final CrossWidgetDelegator? crossWidget;
  CreditCardsList({super.key, this.crossWidget});

  _mayCardProvider(width) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CreditCard(
            width: width / 2 - creditsSpaces,
            isActive: true,
          ),
          CreditCard(
            width: width / 2 - creditsSpaces,
          ),
        ],
      ),
    ];
  }

  final List<Widget> labels = [
    const Text("کارت های من"),
    const Text("دیدن همه"),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cnst) {
        final creditCardwidth = cnst.maxWidth * 65 / 100;

        final size =
            CreditCard.calculateCardSize(creditCardwidth / 2 - creditsSpaces);

        const space = SizedBox(
          height: 10,
        );

        final List<Widget> mainRowChildren = [
          SizedBox(
            width: creditCardwidth,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: labels,
                ),
                space,
                ..._mayCardProvider(creditCardwidth),
              ],
            ),
          ),
        ];

        if (crossWidget != null) {
          mainRowChildren.addAll([
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [...crossWidget!.labels],
                  ),
                  space,
                  SizedBox(
                    height: size.height,
                    child: crossWidget!.box,
                  ),
                ],
              ),
            ),
          ]);
        }

        return Row(
          children: mainRowChildren,
        );
      },
    );
  }
}
