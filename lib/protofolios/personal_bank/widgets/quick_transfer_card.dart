import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuickTransferCard extends StatelessWidget {
  QuickTransferCard({super.key});

  final contacts = <_Contact>[
    _Contact("معصومه جوانکلایی", "assets/images/girl1.jpg", "مدیرعامل"),
    _Contact("سید کاظم محمودی چاهدشتی", "assets/images/man1.jpg", "کارگردان"),
    _Contact("کامبیز باقری", "assets/images/man2.jpg", "طراح"),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: contacts
                        .map(
                          (contact) => Column(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100)),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset(contact.avatarURL),
                                ),
                              ),
                              Text(contact.fullName),
                              Text(contact.description)
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 8,
                        offset: Offset(-3, 3),
                        color: Color.fromARGB(20, 0, 0, 0),
                      ),
                    ],
                  ),
                  child: Icon(Icons.keyboard_arrow_left_rounded),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "مبلغ را وارد کنید",
                  style: TextStyle(
                      color: Color.fromARGB(255, 113, 142, 191), fontSize: 16),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(255, 237, 241, 247),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 24, 20, 243),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  color: Colors.white,
                                  Icons.rocket,
                                ),
                                Text(
                                  "ارسال",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Contact {
  final String fullName;
  final String avatarURL;
  final String description;

  _Contact(this.fullName, this.avatarURL, this.description);
}
