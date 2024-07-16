import 'package:flutter/material.dart';
import '../views/dashboard.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainViewTopBar(),
        Expanded(
          child: IndexedStack(
            index: 0,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  print(constraints);
                  return Dashboard();
                },
              )
            ],
          ),
        )
      ],
    );
  }
}

class MainViewTopBar extends StatelessWidget {
  const MainViewTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: const Color.fromRGBO(255, 255, 255, 1),
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
            return Row(
              children: [
                Text(
                  style: Theme.of(context).textTheme.headlineLarge,
                  "چشم انداز",
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.flip(
                        flipX: true,
                        child: const Icon(
                          Icons.search,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color ??
                                    Colors.black),
                            border: InputBorder.none,
                            hintText: 'عبارتی را جستجو کنید',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
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
                      child: Image.asset('assets/images/cat.jpg'),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
