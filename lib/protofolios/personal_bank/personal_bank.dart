import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/main_view.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/sidebar.dart';

// ignore: must_be_immutable
class PersonalBank extends StatelessWidget {
  PersonalBank({super.key});
  StreamController<int> sideViewChannel = StreamController();

  int viewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 14),
          titleMedium: TextStyle(
            fontSize: 16,
            color: AppColors.navi_blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Row(
            children: [
              SideBar(
                newIndexSink: sideViewChannel.sink,
              ),
              Expanded(
                child: MainView(
                  indexDistpacher: sideViewChannel.stream,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
