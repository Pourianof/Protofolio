import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/setting_field_wrap.dart';
import 'package:provider/provider.dart';

class SettingFormDimensions {
  final double availableWidth;
  final double availableHeigth;
  final double gap;

  const SettingFormDimensions({
    required this.availableHeigth,
    required this.availableWidth,
    required this.gap,
  });
}

class SettingsFullFieldForm extends StatelessWidget {
  final List<SettingFieldWrap> rows;
  const SettingsFullFieldForm({
    super.key,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    const gap = 20.0;
    final List<Widget> wrapRows = [];
    for (final r in rows) {
      wrapRows.addAll([
        r,
        const SizedBox(
          height: gap,
          width: gap,
        ),
      ]);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Provider.value(
          value: SettingFormDimensions(
            availableHeigth: constraints.maxHeight,
            availableWidth: constraints.maxWidth,
            gap: gap,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: wrapRows,
          ),
        );
      },
    );
  }
}
