import 'package:flutter/material.dart';
import '../../../utils/number_text.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  _mayCardProvider() {
    return [
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("کارت های من"),
          Text("دیدن همه"),
        ],
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CreditCard(
            isActive: true,
          ),
          CreditCard(),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final cardSize = CreditCard.calculateCardSize(context);
    final cardWidth = cardSize.width * 2 + 20;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: cardWidth, minWidth: cardWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _mayCardProvider(),
              ),
            ),
            Column(
              children: [
                const Text("تراکنش های اخیر"),
                Container(
                  constraints: BoxConstraints.tight(
                    Size(250, cardSize.height),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: ListView(
                      children: [
                        ListTile(
                          autofocus: true,
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 245, 217),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                                color: Color.fromARGB(255, 255, 185, 56),
                                Icons.credit_card),
                          ),
                          title: const Text("برداشت از حساب من"),
                          subtitle: const Text("8 مرداد 1403"),
                        ),
                        ListTile(
                          autofocus: true,
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 231, 237, 255),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                                color: Color.fromARGB(255, 70, 30, 232),
                                Icons.paypal_outlined),
                          ),
                          title: const Text("واریز پی پال"),
                          subtitle: const Text("8 مرداد 1403"),
                        ),
                        ListTile(
                          autofocus: true,
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 220, 250, 248),
                                borderRadius: BorderRadius.circular(100)),
                            child: const Icon(
                                color: Color.fromARGB(255, 22, 219, 203),
                                Icons.paypal_outlined),
                          ),
                          title: const Text("موسی جعفری"),
                          subtitle: const Text("8 مرداد 1403"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class CreditCard extends StatelessWidget {
  final bool isActive;
  const CreditCard({super.key, this.isActive = false});

  static Size calculateCardSize(BuildContext ctx) {
    final size = MediaQuery.of(ctx).size;
    final mainViewWidth = size.width - 200;
    final width = mainViewWidth * 30 / 100;
    final height = width / 1.6;
    return Size(width, height);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(CreditCard.calculateCardSize(context)),
      child: Theme(
        data: ThemeData(
          iconTheme: IconThemeData(
            color: isActive
                ? Colors.white
                : const Color.fromARGB(255, 52, 60, 106),
          ),
          textTheme: TextTheme(
            bodySmall: TextStyle(
              color: isActive
                  ? Colors.white
                  : const Color.fromARGB(255, 52, 60, 106),
            ),
            bodyMedium: TextStyle(
              color: isActive
                  ? Colors.white
                  : const Color.fromARGB(255, 52, 60, 106),
            ),
          ),
        ),
        child: Card(
          elevation: 0,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: !isActive
                  ? const Border.fromBorderSide(
                      BorderSide(
                        color: Color.fromARGB(255, 223, 234, 242),
                      ),
                    )
                  : null,
              color: isActive ? null : Colors.white,
              gradient: isActive
                  ? const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 10, 6, 244),
                        Color.fromARGB(255, 76, 73, 237),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(top: 40, bottom: 20, left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(style: TextStyle(fontSize: 10), "موجودی حساب"),
                          NumberText(textNumber: "2,568,570 تومان")
                        ],
                      ),
                      Icon(Icons.credit_card)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(style: TextStyle(fontSize: 10), "صاحب کارت"),
                          Text("پوریا امینی"),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Column(
                        children: [
                          Text(style: TextStyle(fontSize: 10), "تاریخ انقضاء"),
                          NumberText(textNumber: "12/22"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  decoration: BoxDecoration(
                    border: !isActive
                        ? const BorderDirectional(
                            top: BorderSide(
                              color: Color.fromARGB(255, 223, 234, 242),
                            ),
                          )
                        : null,
                    gradient: isActive
                        ? const LinearGradient(
                            colors: [
                                Color.fromARGB(55, 255, 255, 255),
                                Color.fromARGB(1, 255, 255, 255)
                              ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)
                        : null,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NumberText(textNumber: "6037 **** **** 1234"),
                      Icon(Icons.paypal)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
