import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/setting_field.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/settings_full_field_form.dart';
import 'package:provider/provider.dart';

class SettingFieldWrap extends StatelessWidget {
  final List<SettingField> fields;
  const SettingFieldWrap({super.key, required this.fields});

  @override
  Widget build(BuildContext context) {
    if (fields.isEmpty) {
      return Container();
    }

    final dims = Provider.of<SettingFormDimensions>(context);
    final List<Widget> wrapChildren = [];
    final innerGap = dims.gap;
    final gap = SizedBox(
      width: innerGap,
      height: innerGap,
    );

    for (final sf in fields) {
      wrapChildren.addAll([sf, gap]);
    }

    wrapChildren.removeLast();

    return Provider<SettingFormDimensions>.value(
      value: SettingFormDimensions(
        availableHeigth: dims.availableHeigth,
        availableWidth: dims.availableWidth / fields.length - dims.gap,
        gap: dims.gap,
      ),
      child: Wrap(
        alignment: WrapAlignment.start,
        children: wrapChildren,
      ),
    );
  }
}
