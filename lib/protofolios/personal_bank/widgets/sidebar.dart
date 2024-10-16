import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/main_view_event.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';

List<Map<String, dynamic>> items = [
  {
    "name": "داشبورد",
    "icon": BankIcons.home,
  },
  {
    "name": "تراکنش ها",
    "icon": BankIcons.transactions,
  },
  {
    "name": "حساب ها",
    "icon": BankIcons.account,
  },
  {
    "name": "سرمایه گذاری",
    "icon": BankIcons.invest,
  },
  {
    "name": "کارت‌های اعتباری",
    "icon": BankIcons.creditCard,
  },
  {
    "name": "وام ها",
    "icon": BankIcons.income,
  },
  {
    "name": "خدمات",
    "icon": BankIcons.services,
  },
  {
    "name": "دسترسی های من",
    "icon": BankIcons.privilage,
  },
  {
    "name": "تنظیمات",
    "icon": BankIcons.settingFill,
  }
];

class SideBar extends StatefulWidget {
  final Sink<MainViewEvent> newIndexSink;
  const SideBar({super.key, required this.newIndexSink});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int selectedItemIndex = 0;
  int hoveredItemIndex = -1;

  _provideLinkButton(
      {required String name, IconData? icon, required int index}) {
    const selectedColor = Color.fromARGB(255, 45, 97, 255);
    const hoveredColor = Color.fromARGB(255, 46, 80, 182);
    final isSelected = selectedItemIndex == index;
    final isHovered = hoveredItemIndex == index;

    final List<Widget> stackChildren = [
      MouseRegion(
        onEnter: (event) => setState(() {
          if (selectedItemIndex != index) {
            hoveredItemIndex = index;
          }
        }),
        onExit: (event) => setState(() {
          if (selectedItemIndex != index) {
            hoveredItemIndex = -1;
          }
        }),
        child: InkWell(
          onTap: () {
            if (index != selectedItemIndex && index != 7) {
              setState(() {
                selectedItemIndex = index;
              });
              widget.newIndexSink.add(
                MainViewEvent(
                  index: index,
                  title: items[index]["name"],
                ),
              );
            }
          },
          child: Container(
            color: isHovered ? const Color.fromARGB(45, 175, 175, 175) : null,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              children: [
                icon != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Icon(
                          size: 25,
                          icon,
                          color: index == selectedItemIndex
                              ? selectedColor
                              : isHovered
                                  ? hoveredColor
                                  : null,
                        ),
                      )
                    : Container(),
                Text(
                  style: TextStyle(
                    fontSize: 18,
                    color: index == selectedItemIndex
                        ? selectedColor
                        : isHovered
                            ? hoveredColor
                            : AppColors.mainLightGrey_200,
                  ),
                  name,
                  // style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    ];

    if (isSelected) {
      stackChildren.add(
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          child: Container(
            width: 5,
            decoration: const BoxDecoration(
              color: selectedColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          ),
        ),
      );
    }

    return Stack(
      children: stackChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    const mainTextStyle = TextStyle(
      color: Color.fromARGB(255, 177, 177, 177),
      fontSize: 18,
    );

    return Theme(
      data: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: mainTextStyle,
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 177, 177, 177),
          size: 30,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              color: AppColors.borderColor,
            ),
          ),
          color: Colors.white,
        ),
        child: SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 80,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // icon
                      Text(
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          'بانک شخصی')
                    ],
                  ),
                ),
              ),
              ...items.indexed.map(
                (e) {
                  final (index, map) = e;
                  return _provideLinkButton(
                    name: map["name"],
                    icon: map["icon"],
                    index: index,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
