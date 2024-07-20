import 'package:flutter/material.dart';

class PartitionItem {
  final Widget widget;
  final int flex;

  PartitionItem(this.widget, this.flex);
}

class PartitionRow {
  final List<PartitionItem> items;

  final double? height;
  PartitionRow(this.items, this.height);
}

class PartitionLayout extends StatelessWidget {
  final List<PartitionRow> partitions;
  const PartitionLayout({
    super.key,
    required this.partitions,
  });

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
          const SizedBox(
            width: 20,
          ),
        );
      }
    }

    return Container(
      height: partition.height,
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Row(
        children: items,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: partitions.map(makeARow).toList(),
      ),
    );
  }
}
