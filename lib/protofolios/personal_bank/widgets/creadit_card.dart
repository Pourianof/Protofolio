import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/number_text.dart';

class CreditCard extends StatelessWidget {
  final bool isActive;
  final double width;
  const CreditCard({
    super.key,
    this.isActive = false,
    required this.width,
  });

  static Size calculateCardSize(double width) {
    final height = width / 1.6;
    return Size(width, height);
  }

  @override
  Widget build(BuildContext context) {
    final size = calculateCardSize(width);
    return ConstrainedBox(
      constraints: BoxConstraints.tight(size),
      child: Theme(
        data: ThemeData(
          iconTheme: IconThemeData(
            size: 40,
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
          margin: EdgeInsets.zero,
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
                Padding(
                  padding: EdgeInsets.all(size.width / 12),
                  child: const Row(
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
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
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
