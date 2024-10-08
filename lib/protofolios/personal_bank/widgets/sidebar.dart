import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  final Sink<int> newIndexSink;
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
            if (index != selectedItemIndex) {
              setState(() {
                selectedItemIndex = index;
              });
              widget.newIndexSink.add(index);
            }
          },
          child: Container(
            color: isHovered ? const Color.fromARGB(45, 175, 175, 175) : null,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                icon != null
                    ? Icon(
                        icon,
                        color: index == selectedItemIndex
                            ? selectedColor
                            : isHovered
                                ? hoveredColor
                                : null,
                      )
                    : Container(),
                Text(
                  style: TextStyle(
                    color: index == selectedItemIndex
                        ? selectedColor
                        : isHovered
                            ? hoveredColor
                            : null,
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

  List<Map<String, dynamic>> items = [
    {
      "name": "داشبورد",
      "icon": Icons.home_rounded,
    },
    {
      "name": "تراکنش ها",
      "icon": Icons.money_off_rounded,
    },
    {
      "name": "حساب ها",
      "icon": Icons.person,
    },
    {
      "name": "سرمایه گذاری",
      "icon": Icons.addchart_rounded,
    },
    {
      "name": "داشبورد",
      "icon": Icons.currency_pound_outlined,
    },
    {
      "name": "خدمات",
      "icon": Icons.electrical_services,
    },
    {
      "name": "دسترسی های من",
      "icon": Icons.local_activity_outlined,
    },
    {
      "name": "تنظیمات",
      "icon": Icons.settings,
    }
  ];

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
        color: Colors.white,
        child: SizedBox(
          width: 250,
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
