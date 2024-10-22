import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/auth.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/main_view_event.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/preference.dart';
import 'package:my_portfolio/protofolios/personal_bank/providers/preference_provider.dart';
import 'package:my_portfolio/protofolios/personal_bank/providers/user_provider.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_styles.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/main_view.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/responsive_layout.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/sidebar.dart';
import 'package:my_portfolio/shared/partition_layout/partion_layout_theme.dart';
import 'package:my_portfolio/shared/sacaler.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

// ignore: must_be_immutable
class PersonalBank extends StatelessWidget {
  PersonalBank({super.key});
  StreamController<MainViewEvent> sideViewChannel =
      StreamController.broadcast();

  int viewIndex = 0;
  GlobalKey mainViewGK = GlobalKey();

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 16,
      color: Color.fromARGB(255, 113, 142, 191),
    );
    return Theme(
      data: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
        switchTheme: const SwitchThemeData(
          thumbColor: WidgetStatePropertyAll(Colors.white),
          trackColor: WidgetStatePropertyAll(AppColors.chartCyan),
          trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
          trackOutlineWidth: WidgetStatePropertyAll(0),
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
          bodyLarge: bodyStyle,
          labelLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            color: AppColors.navi_blue,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: bodyStyle,
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
      child: DefaultSelectionStyle(
        cursorColor: AppColors.mainLightGrey,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<Auth>(
              create: (_) {
                return Auth();
              },
            ),
            ChangeNotifierProxyProvider<Auth, UserProvider>(
              create: (context) {
                return UserProvider();
              },
              update: (ctx, auth, olderUser) {
                return UserProvider(auth: auth);
              },
            ),
            ChangeNotifierProvider(
              create: (context) => PreferenceProvider.initial(
                Preference(
                  currency: 'تومان',
                  digitalCurrencySupportNotif: true,
                  merchanchOrderNotif: false,
                  recommendationNotif: true,
                  timeZone: '(GMT-15:30) Tehran - Iran',
                ),
              ),
            )
          ],
          builder: (ctx, val) => ResponsiveBreakpoints(
            breakpoints: const [
              Breakpoint(
                start: 800,
                end: double.infinity,
                name: DESKTOP,
              ),
              Breakpoint(
                start: 0,
                end: 800,
                name: MOBILE,
              ),
            ],
            child: Builder(
              builder: (ctx) => Sacaler(
                // autoCalculateMediaQueryData: true,
                baseOnWidth: ResponsiveValue<double?>(
                  ctx,
                  conditionalValues: const [
                    Condition.largerThan(breakpoint: 800, value: 1440),
                    Condition.between(start: 400, end: 800, value: null),
                    Condition.smallerThan(breakpoint: 400, value: 400),
                  ],
                ).value,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Scaffold(
                    drawer: ResponsiveLayout.isMobile(ctx)
                        ? SideBar(
                            newIndexSink: sideViewChannel.sink,
                          )
                        : null,
                    backgroundColor: AppColors.backgroundColor,
                    body: Row(
                      children: [
                        if (!ResponsiveLayout.isMobile(context))
                          SideBar(
                            newIndexSink: sideViewChannel.sink,
                          ),
                        Expanded(
                          child: PartionLayoutTheme(
                            data: PartionLayoutThemeData(
                              rowInsets: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 10,
                              ),
                              partionItemGap: 30,
                              columanize:
                                  MediaQuery.of(context).size.width < 800,
                            ),
                            child: MainView(
                              indexDistpacher: sideViewChannel.stream,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
