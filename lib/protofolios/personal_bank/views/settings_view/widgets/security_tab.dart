import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/auth.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/holder.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/labeled_switch.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/setting_field.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/setting_field_wrap.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/settings_full_field_form.dart';
import 'package:provider/provider.dart';

class SecurityTab extends StatefulWidget {
  const SecurityTab({super.key});

  @override
  State<SecurityTab> createState() => _SecurityTabState();
}

class _SecurityTabState extends State<SecurityTab> with Holder<AuthState> {
  @override
  updateHoldData(AuthState newData) {
    super.updateHoldData(newData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context);
    holdData ??= authProvider.authState;

    const gap = SizedBox(width: 15, height: 15);
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "احراز هویت دو مرحله ای",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.titleDarkPurple,
            ),
          ),
          gap,
          LabeledSwitch(
            currentState: holdData!.twoFactorAuthState,
            label: "فعال یا غیر فعال کردن احراز هویت دو مرحله ای  ",
            onChange: (val) {
              updateHoldData(
                holdData!.copyWith(
                  newTwoFactorAuthState: val,
                ),
              );
            },
          ),
          gap,
          SettingsFullFieldForm(
            rows: [
              SettingFieldWrap(
                fields: [
                  SettingField(
                    title: "رمز عبور فعلی",
                    initialValue: List.generate(8, (_) => '*').join(''),
                  ),
                ],
              ),
              SettingFieldWrap(
                fields: [
                  SettingField(
                    title: "رمز عبور جدید",
                    initialValue: List.generate(8, (_) => '*').join(''),
                  ),
                ],
              ),
            ],
          ),
          gap,
          ElevatedButton(
            onPressed: () {
              authProvider.updateHoldData(holdData!);
            },
            child: const Text("ذخیره"),
          )
        ],
      ),
    );
  }
}
