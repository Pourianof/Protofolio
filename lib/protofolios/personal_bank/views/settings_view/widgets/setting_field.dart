import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/helpers/validators.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/settings_full_field_form.dart';
import 'package:provider/provider.dart';

String? Function(String? val) _defaultValidator(int minLength) {
  return (String? val) {
    if (val == null) {
      return "این فیلد نمیتواند خالی باشد";
    }
    return minLengthStringValidator(
      val,
      minLength: minLength,
    );
  };
}

class SettingField extends StatelessWidget {
  final String title;
  final Widget? field;
  final String? initialValue;
  final void Function(String? val)? onSave;
  final String? Function(String? val)? onValidate;
  final int? minLength;
  final TextInputType? type;
  const SettingField({
    super.key,
    required this.title,
    this.field,
    this.initialValue,
    this.onSave,
    this.onValidate,
    this.minLength,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingFormDimensions>(
      builder: (context, value, child) {
        return SizedBox(
          width: value.availableWidth,
          child: child,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(
            height: 10,
          ),
          field ??
              TextFormField(
                onSaved: onSave,
                initialValue: initialValue,
                keyboardType: type,
                validator: onValidate ?? _defaultValidator(minLength ?? 6),
              ),
        ],
      ),
    );
  }
}
