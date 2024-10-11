import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/bank_card.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/standard_texts.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BankCard(
      child: Column(
        children: [
          const NonActiveLink(
            "کارت اعتباری به طور کلی به معنای کارت پلاستیکی صادر شده توسط بانک های تجاری برنامه ریزی شده است که به دارنده کارت اختصاص داده شده است، با محدودیت اعتباری که می تواند برای خرید کالا و خدمات به صورت اعتباری یا دریافت پیش پرداخت نقدی استفاده شود.",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 25),
          _NewCardForm(),
        ],
      ),
    );
  }
}

class _NewCardForm extends StatelessWidget {
  _NewCardForm({super.key});

  final TextEditingController colorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("نوع کارت"),
                    const SizedBox(height: 15),
                    LayoutBuilder(builder: (context, cnst) {
                      return DropdownMenu(
                        width: cnst.maxWidth,
                        controller: colorController,
                        dropdownMenuEntries: const <DropdownMenuEntry>[
                          DropdownMenuEntry(
                            label: "سنتی",
                            enabled: true,
                            value: "سنتی",
                          ),
                          DropdownMenuEntry(
                            label: 'الکترونیکی',
                            value: 'الکترونیکی',
                          ),
                          DropdownMenuEntry(
                            label: 'جانبی',
                            value: 'جانبی',
                          ),
                        ],
                      );
                    })
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("نام روی کارت"),
                    SizedBox(height: 15),
                    TextField(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("نام روی کارت"),
                    SizedBox(height: 15),
                    TextField(),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("نام روی کارت"),
                    SizedBox(height: 15),
                    TextField(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("افزودن کارت"),
            ),
          )
        ],
      ),
    );
  }
}
