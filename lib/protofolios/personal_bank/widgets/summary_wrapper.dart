import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/responsive_layout.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/summary_item.dart';
import 'package:my_portfolio/shared/partition_layout/partition_layout.dart';
import 'package:my_portfolio/shared/partition_layout/partion_layout_theme.dart';

class SummaryWrapper extends StatelessWidget {
  final List<SummaryItem> items;
  const SummaryWrapper({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    Widget row;

    final themeData = PartionLayoutTheme.of(context);
    final gap = SizedBox(
      width: themeData?.partionItemGap ?? 30,
    );
    if (ResponsiveLayout.isMobile(context)) {
      final gappedItems = items.expand((i) => [i, gap]).toList()..removeLast();
      row = SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: gappedItems,
          ));
    } else {
      final gappedItems = items
          .map((i) => Flexible(flex: 1, child: i))
          .expand((i) => [i, gap])
          .toList()
        ..removeLast();
      row = Row(
        children: gappedItems,
      );
    }

    return row;
  }
}
