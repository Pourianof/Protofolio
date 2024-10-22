import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';
import 'package:my_portfolio/utils/number_text.dart';

class TransactionsBox extends StatelessWidget {
  const TransactionsBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  color: Color.fromARGB(255, 255, 185, 56), Icons.credit_card),
            ),
            title: const Text("برداشت از حساب من"),
            subtitle: const NonActiveLink(
              "8 مرداد 1403",
            ),
            trailing: const NumberText(
              textNumber: "-\$724",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 14,
              ),
            ),
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
            subtitle: const NonActiveLink("8 مرداد 1403"),
            trailing: const NumberText(
              textNumber: "+\$3,481",
              style: TextStyle(
                color: Colors.lightGreen,
                fontSize: 14,
              ),
            ),
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
            subtitle: const NonActiveLink("8 مرداد 1403"),
            trailing: const NumberText(
              textNumber: "+\$1,740",
              style: TextStyle(
                color: Colors.lightGreen,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
