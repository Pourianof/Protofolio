import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/MainView.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/sidebar.dart';

class PersonalBank extends StatelessWidget {
  const PersonalBank({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          SideBar(),
          Expanded(
            child: MainView(),
          ),
        ],
      ),
    );
  }
}
