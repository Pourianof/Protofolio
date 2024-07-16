import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  _provideLinkButton({required String name, IconData? icon}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          icon != null ? Icon(icon) : Container(),
          Text(name),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            const SizedBox(
              height: 80,
              child: Center(
                child: Row(
                  children: [
                    // icon
                    Text('بانک شخصی')
                  ],
                ),
              ),
            ),
            _provideLinkButton(name: "داشبورد", icon: Icons.home_rounded),
            _provideLinkButton(
                name: "تراکنش ها", icon: Icons.money_off_rounded),
            _provideLinkButton(name: "حساب ها", icon: Icons.person),
            _provideLinkButton(
                name: "سرمایه گذاری", icon: Icons.addchart_rounded),
            _provideLinkButton(
                name: "کارت های اعتباری", icon: Icons.credit_card),
            _provideLinkButton(
                name: "داشبورد", icon: Icons.currency_pound_outlined),
            _provideLinkButton(name: "خدمات", icon: Icons.electrical_services),
            _provideLinkButton(
                name: "دسترسی های من", icon: Icons.local_activity_outlined),
            _provideLinkButton(name: "تنظیمات", icon: Icons.settings),
          ],
        ),
      ),
    );
  }
}
