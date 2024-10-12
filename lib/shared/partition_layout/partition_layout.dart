import 'package:flutter/material.dart';
import 'package:my_portfolio/shared/partition_layout/partion_layout_theme.dart';
import 'package:provider/provider.dart';

class PartitionItem {
  final Widget widget;
  final int flex;

  PartitionItem(this.widget, this.flex);
}

class PartitionRow {
  final List<PartitionItem> items;

  final double? height;
  PartitionRow(
    this.items, {
    this.height,
  });
}

class PartitionLayout extends StatelessWidget {
  final List<PartitionRow> partitions;
  PartitionLayout({
    super.key,
    required this.partitions,
  });

  late PartionLayoutTheme _themeData;

  Widget makeARow(PartitionRow partition) {
    final List<Widget> items = [];

    for (int i = 0; i < partition.items.length; i++) {
      items.addAll(
        [
          Flexible(
            fit: FlexFit.tight,
            flex: partition.items[i].flex,
            child: partition.items[i].widget,
          ),
        ],
      );

      if (i != partition.items.length - 1) {
        items.add(
          SizedBox(
            width: _themeData.partionItemGap,
          ),
        );
      }
    }

    final isBounded = partition.height != null;

    return Container(
      height: partition.height,
      padding: _themeData.rowInsets,
      child: Row(
        crossAxisAlignment:
            isBounded ? CrossAxisAlignment.stretch : CrossAxisAlignment.center,
        children: items,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PartionLayoutTheme>(
      builder: (context, value, child) {
        _themeData = value;
        return SingleChildScrollView(
          child: Column(
            children: partitions.map(makeARow).toList(),
          ),
        );
      },
    );
  }
}
