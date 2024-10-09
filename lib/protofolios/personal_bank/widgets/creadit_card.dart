import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/number_text.dart';

enum CreaditCardStyleTheme { active, inactive, highlight }

class CreditCard extends StatelessWidget {
  final CreaditCardStyleTheme? styleTheme;
  const CreditCard(
      {super.key, this.styleTheme = CreaditCardStyleTheme.inactive});

  get _gradient {
    List<Color> gradColors = [];
    if (isHighlight) {
      gradColors = [
        const Color.fromARGB(255, 45, 97, 255),
        const Color.fromARGB(255, 83, 155, 255),
      ];
    } else if (isActive) {
      gradColors = [
        const Color.fromARGB(255, 10, 6, 244),
        const Color.fromARGB(255, 76, 73, 237),
      ];
    }
    if (gradColors.isNotEmpty) {
      return LinearGradient(
        colors: gradColors,
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      );
    }
  }

  get fontColor {
    return styleTheme == CreaditCardStyleTheme.inactive
        ? const Color.fromARGB(255, 52, 60, 106)
        : Colors.white;
  }

  get isActive {
    return styleTheme == CreaditCardStyleTheme.active;
  }

  get isInActive {
    return styleTheme == CreaditCardStyleTheme.inactive;
  }

  get isHighlight {
    return styleTheme == CreaditCardStyleTheme.highlight;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        iconTheme: IconThemeData(
          size: 40,
          color: fontColor,
        ),
        textTheme: TextTheme(
          bodySmall: TextStyle(
            color: fontColor,
          ),
          bodyMedium: TextStyle(
            color: fontColor,
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
            border: isInActive
                ? const Border.fromBorderSide(
                    BorderSide(
                      color: Color.fromARGB(255, 223, 234, 242),
                    ),
                  )
                : null,
            color: isInActive ? Colors.white : null,
            gradient: _gradient,
          ),
          child: Wrap(
            runAlignment: WrapAlignment.spaceEvenly,
            direction: Axis.horizontal,
            children: [
              const Padding(
                padding: EdgeInsets.all(30),
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
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                decoration: BoxDecoration(
                  border: isInActive
                      ? const BorderDirectional(
                          top: BorderSide(
                            color: Color.fromARGB(255, 223, 234, 242),
                          ),
                        )
                      : null,
                  gradient: !isInActive
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
    );
  }
}
