import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/main_view_event.dart';
import 'package:my_portfolio/protofolios/personal_bank/providers/user_provider.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/accounts/accounts.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/investments/investments.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/loans/loans.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/my_cards/my_cards.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/services/srvices.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/settings_view.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/transactions.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/responsive_layout.dart';
import 'package:provider/provider.dart';
import '../views/dashboard.dart';

class MainView extends StatefulWidget {
  final Stream<MainViewEvent> indexDistpacher;
  const MainView({super.key, required this.indexDistpacher});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late StreamSubscription onDispatchSub;
  int displayingViewIndex = 0;
  String title = "چشم انداز";

  @override
  void initState() {
    super.initState();
    onDispatchSub = widget.indexDistpacher.listen(_onIndexDispatched);
  }

  _onIndexDispatched(MainViewEvent event) {
    if (event.index != displayingViewIndex) {
      setState(() {
        displayingViewIndex = event.index;
        title = event.title;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainViewTopBar(title: title),
        Expanded(
          child: IndexedStack(
            index: displayingViewIndex,
            children: [
              const Dashboard(),
              const Transactions(),
              const AccountView(),
              const Investments(),
              const MyCards(),
              const Loans(),
              const Srvices(),
              Container(),
              SettingsView(),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    onDispatchSub.cancel();
    super.dispose();
  }
}

class MainViewTopBar extends StatelessWidget {
  final String title;
  const MainViewTopBar({super.key, required this.title});

  getTitle(BuildContext context) {
    return Text(
      style: Theme.of(context).textTheme.headlineLarge,
      title,
    );
  }

  getSearchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(100),
      ),
      width: ResponsiveLayout.isMobile(context) ? null : 250,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20.0),
            child: Transform.flip(
              flipX: true,
              child: const Icon(
                BankIcons.search,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color ??
                        Colors.black),
                border: InputBorder.none,
                hintText: 'عبارتی را جستجو کنید',
              ),
            ),
          )
        ],
      ),
    );
  }

  getSetting(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        icon: const Icon(BankIcons.settingsOutline),
        onPressed: () {},
      ),
    );
  }

  getNotifButton(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        icon: const Icon(
          BankIcons.notif,
          color: Colors.red,
        ),
        onPressed: () {},
      ),
    );
  }

  getAvatar() {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        final user = userProvider.holdData;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(100),
          ),
          clipBehavior: Clip.antiAlias,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image(
              image: user!.avatar,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ResponsiveLayout.isMobile(context) ? ,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor),
        ),
        color: Colors.white,
      ),
      child: Theme(
        data: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.white,
            onPrimary: Colors.white,
            secondary: Color.fromARGB(255, 245, 247, 250),
            onSecondary: Color.fromARGB(255, 245, 247, 250),
            error: Colors.red,
            onError: Colors.red,
            surface: Colors.white,
            onSurface: Colors.white,
          ),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 113, 142, 191),
          ),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color.fromARGB(255, 52, 60, 106),
            ),
            labelMedium: TextStyle(
              fontSize: 12,
            ),
            bodyMedium: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 139, 162, 203),
            ),
          ),
        ),
        child: Builder(
          builder: (context) {
            return ResponsiveLayout(
              desktopMode: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    getTitle(context),
                    const Spacer(),
                    getSearchBar(context),
                    getSetting(context),
                    getNotifButton(context),
                    getAvatar(),
                  ],
                ),
              ),
              mobileMode: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(Icons.menu),
                        ),
                        const Spacer(),
                        getTitle(context),
                        const Spacer(),
                        getAvatar(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    getSearchBar(context),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
