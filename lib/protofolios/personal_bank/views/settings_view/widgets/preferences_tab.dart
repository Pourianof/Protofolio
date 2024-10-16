import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/holder.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/preference.dart';
import 'package:my_portfolio/protofolios/personal_bank/providers/preference_provider.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/labeled_switch.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/setting_field.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/setting_field_wrap.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/settings_full_field_form.dart';
import 'package:provider/provider.dart';

class PreferencesTab extends StatefulWidget {
  const PreferencesTab({super.key});

  @override
  State<PreferencesTab> createState() => _PreferencesTabState();
}

class _PreferencesTabState extends State<PreferencesTab>
    with Holder<Preference> {
  final GlobalKey<FormState> formGK = GlobalKey();
  @override
  updateHoldData(Preference newData) {
    super.updateHoldData(newData);
    setState(() {});
  }

  _provideLabeledSwitch(
    String label,
    bool currentState,
    void Function(bool val) onChange,
  ) {
    return LabeledSwitch(
      currentState: currentState,
      label: label,
      onChange: onChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    final prefProvider = Provider.of<PreferenceProvider>(context);
    holdData ??= prefProvider.holdData!;

    const gap = SizedBox(
      height: 15,
    );

    return Form(
      key: formGK,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingsFullFieldForm(
            rows: [
              SettingFieldWrap(
                fields: [
                  SettingField(
                    title: "ارز",
                    initialValue: holdData!.currency,
                    onSave: (val) {
                      updateHoldData(holdData!.copyWith(newCurrency: val));
                    },
                  ),
                  SettingField(
                    title: "منطقه زمانی",
                    initialValue: holdData!.timeZone,
                  ),
                ],
              ),
            ],
          ),
          gap,
          const Text(
            "اعلانات",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.titleDarkPurple,
            ),
          ),
          gap,
          _provideLabeledSwitch(
            "ارسال یا دریافت ارز دیجیتالی",
            holdData!.digitalCurrencySupportNotif,
            (value) {
              updateHoldData(
                holdData!.copyWith(newDigitalCurrencySupportNotif: value),
              );
            },
          ),
          gap,
          _provideLabeledSwitch(
            "سفارشات تجاری",
            holdData!.merchanchOrderNotif,
            (value) {
              updateHoldData(
                holdData!.copyWith(newMerchanchOrderNotif: value),
              );
            },
          ),
          gap,
          _provideLabeledSwitch(
            "پیشنهادات برای حساب شما",
            holdData!.recommendationNotif,
            (value) {
              updateHoldData(
                holdData!.copyWith(newRecommendationNotif: value),
              );
            },
          ),
          gap,
          ElevatedButton(
              onPressed: () {
                if (formGK.currentState!.validate()) {
                  formGK.currentState!.save();
                  prefProvider.updateHoldData(holdData!);
                }
              },
              child: Text("ذخیره"))
        ],
      ),
    );
  }
}
