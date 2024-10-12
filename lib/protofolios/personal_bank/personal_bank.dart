import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_styles.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/main_view.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/sidebar.dart';
import 'package:my_portfolio/shared/partition_layout/partion_layout_theme.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PersonalBank extends StatelessWidget {
  PersonalBank({super.key});
  StreamController<int> sideViewChannel = StreamController();

  int viewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              color: AppColors.borderColor,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              color: AppColors.mainLightGrey,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(
              side: WidgetStatePropertyAll(
                BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              foregroundColor: WidgetStatePropertyAll(Colors.black),
              textStyle: WidgetStatePropertyAll(
                TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              )),
        ),
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.darkBlue),
              textStyle: WidgetStatePropertyAll(
                TextStyle(color: Colors.white),
              ),
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              )),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: AppStyles.cardBorderRadius),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
          bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          labelLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            color: AppColors.navi_blue,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 113, 142, 191),
          ),
          labelSmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w100,
            color: Color.fromARGB(255, 113, 142, 191),
          ),
          titleLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      child: Provider<PartionLayoutTheme>(
        create: (context) {
          return PartionLayoutTheme(
            rowInsets: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            partionItemGap: 30,
          );
        },
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
      ),
    );
  }
}
