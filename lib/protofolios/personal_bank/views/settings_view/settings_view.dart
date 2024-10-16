import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_styles.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/edit_profile_tab.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/preferences_tab.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/security_tab.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/settings_tab_view.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';

class SettingsView extends StatefulWidget {
  SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppStyles.cardBorderRadiusValue,
        right: AppStyles.cardBorderRadiusValue,
        top: AppStyles.cardBorderRadiusValue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingsTabBar(
            controller: controller,
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: const [
                SettingsTabView(
                  child: EditProfileTab(),
                ),
                SettingsTabView(
                  child: PreferencesTab(),
                ),
                SettingsTabView(
                  child: SecurityTab(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsTabBar extends StatefulWidget {
  final TabController controller;
  const SettingsTabBar({super.key, required this.controller});

  @override
  State<SettingsTabBar> createState() => _SettingsTabBarState();
}

class _SettingsTabBarState extends State<SettingsTabBar> {
  final itemWidth = 150.0;
  provideTabBarItem(String title, index) {
    final selected = index == widget.controller.index;

    Widget itemView = Container(
      alignment: Alignment.center,
      width: itemWidth,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: selected ? ActiveLink(title) : Text(title),
    );

    return InkWell(
      child: itemView,
      onTap: () {
        widget.controller.animateTo(index);
        setState(() {});
      },
    );
  }

  _activeItemBorder() {
    return _SettingsTabBarBorder(
      position: widget.controller.index * itemWidth,
      width: itemWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            AppStyles.cardBorderRadiusValue,
          ),
          topLeft: Radius.circular(
            AppStyles.cardBorderRadiusValue,
          ),
        ),
      ),
      child: Stack(children: [
        Row(
          children: [
            provideTabBarItem("ویرایش پروفایل", 0),
            provideTabBarItem("شخصی سازی", 1),
            provideTabBarItem("امنیت", 2),
          ],
        ),
        _activeItemBorder(),
      ]),
    );
  }
}

class _SettingsTabBarBorder extends StatelessWidget {
  final double position;
  final double width;
  const _SettingsTabBarBorder({
    super.key,
    required this.position,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
      right: position,
      bottom: 0,
      child: Container(
        height: 5,
        width: width,
        decoration: const BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
