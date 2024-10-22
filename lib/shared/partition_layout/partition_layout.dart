import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/helpers/helper_functions.dart';
import 'package:my_portfolio/shared/partition_layout/partion_layout_theme.dart';

class PartitionItem {
  final Widget widget;
  final int flex;
  final int? groupId;

  PartitionItem(this.widget, this.flex, [this.groupId]);
}

class PartitionRow {
  final List<PartitionItem> items;

  final double? height;
  final double? aspectRatio;
  PartitionRow(
    this.items, {
    this.height,
    this.aspectRatio,
  });
}

class PartitionLayout extends StatelessWidget {
  final List<PartitionRow> partitions;
  PartitionLayout({
    super.key,
    required this.partitions,
  });

  late PartionLayoutThemeData _themeData;

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

    final hasAR = partition.aspectRatio != null;

    final row = Padding(
      padding: _themeData.rowInsets!,
      child: SizedBox(
        height: hasAR ? null : partition.height,
        child: Row(
          crossAxisAlignment: isBounded
              ? CrossAxisAlignment.stretch
              : CrossAxisAlignment.center,
          children: items,
        ),
      ),
    );

    if (hasAR) {
      return AspectRatio(
        aspectRatio: partition.aspectRatio!,
        child: row,
      );
    }
    return row;
  }

  _getGroupedChildren() {
    Map<int, List<Widget>> widgetGroups =
        {}; // map of groupid to list widgets with that id

    putToList(int groupId, Widget widget) {
      late List<Widget>? groupList = widgetGroups[groupId];

      if (groupList == null) {
        groupList = [];
        widgetGroups.putIfAbsent(groupId, () => groupList!);
      }

      groupList.add(widget);
    }

    partitions.forEach(
      (p) => p.items.forEach((i) {
        Widget widget = p.height != null
            ? SizedBox(
                height: p.height,
                child: i.widget,
              )
            : i.widget;
        if (_themeData.rowInsets != null) {
          widget = Padding(
            padding: _themeData.rowInsets!,
            child: widget,
          );
        }
        if (i.groupId != null) {
          putToList(
            i.groupId!,
            widget,
          );
        } else {
          putToList(-1, widget);
        }
      }),
    );

    final x = (widgetGroups.keys.toList()..sort())
        .map((id) => widgetGroups[id])
        .toList();
    return flatten<Widget>(
      x,
    );
  }

  List<Widget> _getChildren() {
    final columanize = _themeData.columanize;

    if (columanize) {
      return _getGroupedChildren();
    }

    return partitions.map(makeARow).toList();
  }

  @override
  Widget build(BuildContext context) {
    _themeData = PartionLayoutTheme.of(context)!;

    return SingleChildScrollView(
      child: Column(
        children: _getChildren(),
      ),
    );
  }
}
