import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/personal_bank.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pooria\'s protofolios',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 12),
        ),
      ),
      home: const MyProtofolio(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyProtofolio extends StatefulWidget {
  const MyProtofolio({super.key, required this.title});
  final String title;

  @override
  State<MyProtofolio> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyProtofolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 34, 31, 30),
            padding: const EdgeInsets.all(10),
            child: const Center(
              child: Text(
                "مجموعه نمونه کارهای طراحی شده با فلاتر",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            color: Color.fromARGB(166, 255, 255, 255),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(117, 228, 228, 228),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  padding: const EdgeInsets.all(5),
                  child: const Text("سایت املاک"),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(117, 228, 228, 228),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  padding: const EdgeInsets.all(5),
                  child: const Text("بانک شخصی"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: PersonalBank(),
            ),
          ),
        ],
      ),
    );
  }
}
