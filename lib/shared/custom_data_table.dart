import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final _defaultTableConfig = CustomDataTableConfig(
  cellsAllignment: Alignment.center,
);

class CustomDataTable extends StatelessWidget {
  final List<CustomDataTableRow> rows;
  final BorderSide? Function(int index)? dividerGenerator;
  final CustomDataTableConfig? configs;
  const CustomDataTable({
    super.key,
    required this.rows,
    this.configs,
    this.dividerGenerator,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> _rows = [];
    if (dividerGenerator != null) {
      for (int i = 0; i < rows.length; i++) {
        _rows.add(rows[i]);
        final border = dividerGenerator!(i);
        if (border != null) {
          _rows.add(
            _RowDivider(dividerStyle: border),
          );
        }
      }
    } else {
      _rows = rows;
    }
    return TableDefaultConfig(
      tableConfigs: configs ?? _defaultTableConfig,
      child: _CustomDataTableBase(
        rows: _rows,
      ),
    );
  }
}

abstract class _TableDividerBase extends SingleChildRenderObjectWidget {
  _TableDividerBase({super.key, required BorderSide dividerStyle})
      : super(
          child: Container(
            height: dividerStyle.width,
            decoration: BoxDecoration(
              color: dividerStyle.color,
            ),
          ),
        );
}

class _RowDivider extends _TableDividerBase {
  _RowDivider({
    super.key,
    required super.dividerStyle,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderRowDivider();
  }
}

class _RenderRowDivider extends RenderProxyBox {}

class _ColumnDivider extends _TableDividerBase {
  _ColumnDivider({
    super.key,
    required super.dividerStyle,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderColumnDivider();
  }
}

class _RenderColumnDivider extends RenderProxyBox {}

class _CustomDataTableBase extends MultiChildRenderObjectWidget {
  const _CustomDataTableBase({required List<Widget> rows})
      : super(children: rows);

  @override
  RenderObject createRenderObject(BuildContext context) {
    final confs = TableDefaultConfig.of(context);
    final textDirection = Directionality.of(context);
    return _CustomDataTableRenderer(
      rowPadding: confs?.rowPaddings,
      isRTL: textDirection == TextDirection.rtl,
    );
  }
}

class _CustomDataTableRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _CustomDataTableParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _CustomDataTableParentData> {
  final EdgeInsets? rowPadding;
  final bool isRTL;
  _CustomDataTableRenderer({this.rowPadding, required this.isRTL});

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! _CustomDataTableParentData) {
      child.parentData = _CustomDataTableParentData();
    }
  }

  @override
  void performLayout() {
    RenderBox? child = firstChild;

    Map<int, double?> maxWidthOfEachColumn = {};
    while (child != null) {
      final childParentData = child.parentData as _CustomDataTableParentData;

      if (child is _RenderCustomDataRow) {
        final row = child;
        row.computeCellsSizes();

        for (var entry in row.cellSizes.entries) {
          final index = entry.key;
          final size = entry.value;
          final newWidth = size.width;

          if (maxWidthOfEachColumn[index] == null ||
              maxWidthOfEachColumn[index]! < newWidth) {
            maxWidthOfEachColumn[index] = newWidth;
          }
        }
      }

      child = childParentData.nextSibling;
    }

    double rowWidth = 0;
    maxWidthOfEachColumn.forEach(
      (key, value) {
        rowWidth += value!;
      },
    );

    rowWidth += (rowPadding?.horizontal ?? 0);

    final cellSpaceShare =
        constraints.hasBoundedWidth && constraints.maxWidth > rowWidth
            ? (constraints.maxWidth - rowWidth) / maxWidthOfEachColumn.length
            : 0;

    final rowsMaxWidth = maxWidthOfEachColumn.map(
      (key, value) {
        return MapEntry(
          key,
          BoxConstraints.tightFor(width: value! + cellSpaceShare),
        );
      },
    );

    child = firstChild;

    double tableWidth = 0;
    double occupiedHeight = 0;

    while (child != null) {
      final childParentData = child.parentData as _CustomDataTableParentData;

      if (child is _RenderCustomDataRow) {
        child.layout(
          _CustomDataTableConstraints(
            cellsConstraints: rowsMaxWidth,
          ),
          parentUsesSize: true,
        );

        if (tableWidth == 0) {
          tableWidth = child.size.width;
        }

        childParentData.offset =
            Offset(isRTL ? child.size.width : 0, occupiedHeight);
      } else if (child is _RenderRowDivider) {
        child.layout(
          BoxConstraints.tightFor(width: tableWidth),
          parentUsesSize: true,
        );
        childParentData.offset = Offset(0, occupiedHeight);
      }

      occupiedHeight += child.size.height;

      child = childParentData.nextSibling;
    }

    size = Size(
      constraints.hasTightWidth ? constraints.maxWidth : tableWidth,
      constraints.hasTightHeight ? constraints.maxHeight : occupiedHeight,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }
}

class _CustomDataTableParentData extends ContainerBoxParentData<RenderBox> {}

class CustomDataTableRow extends StatelessWidget {
  final List<CustomDataCell> cells;
  const CustomDataTableRow({
    required this.cells,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final tableConfigs = TableDefaultConfig.of(context);

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium ?? const TextStyle(),
      softWrap: false,
      child: _CustomDataRow(
        cells: cells,
        padding: tableConfigs?.rowPaddings ?? _defaultTableConfig.rowPaddings,
      ),
    );
  }
}

class _CustomDataRow extends MultiChildRenderObjectWidget {
  final EdgeInsets? padding;
  const _CustomDataRow({
    super.key,
    required List<Widget> cells,
    this.padding,
  }) : super(children: cells);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderCustomDataRow(
      padding: padding,
      textDirection: Directionality.of(context),
    );
  }
}

class _RenderCustomDataRow extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _CustomDataTableRowParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox,
            _CustomDataTableRowParentData> {
  EdgeInsets? padding;
  TextDirection? textDirection;
  _RenderCustomDataRow({this.padding, this.textDirection});

  @override
  void insert(RenderBox child, {RenderBox? after}) {
    super.insert(child, after: after);
    _setLastChildIndex();
  }

  _setLastChildIndex() {
    final parentData = lastChild!.parentData as _CustomDataTableRowParentData;
    final previousChild = parentData.previousSibling;
    if (previousChild != null) {
      parentData.cellIndex =
          ((previousChild.parentData as _CustomDataTableRowParentData)
                      .cellIndex ??
                  -1) +
              1;
    } else {
      parentData.cellIndex = 0;
    }
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! _CustomDataTableRowParentData) {
      child.parentData = _CustomDataTableRowParentData();
    }
  }

  Map<int, Size>? _cellSizes;

  @override
  void markNeedsLayout() {
    super.markNeedsLayout();
    _cellSizes = null;
  }

  late Size _lastComputedSize;

  computeCellsSizes() {
    if (_cellSizes != null) {
      return _lastComputedSize;
    }
    ;
    RenderBox? child = firstChild;

    final calculatedCellSizes = <int, Size>{};
    double height = 0;
    double width = 0;

    while (child != null) {
      final childParentData = child.parentData as _CustomDataTableRowParentData;

      Size childSize = child.getDryLayout(
        const BoxConstraints(),
      );

      width += childSize.width;
      height = max(height, childSize.height);

      calculatedCellSizes.addEntries([
        MapEntry(
          childParentData.cellIndex!,
          childSize,
        )
      ]);

      child = childParentData.nextSibling;
    }
    _cellSizes = calculatedCellSizes;

    return _lastComputedSize = Size(
      width + (padding?.horizontal ?? 0),
      height + (padding?.vertical ?? 0),
    );
  }

  Map<int, Size> get cellSizes {
    assert(_cellSizes != null, () {
      throw Exception(
          "No cell size exist. It seems try to access this property before perform layout.");
    });

    return _cellSizes!;
  }

  @override
  void performLayout() {
    RenderBox? child = firstChild;

    if (child == null) {
      size = Size.zero;
      return;
    }

    final isRTL = textDirection == TextDirection.rtl;
    double occupiedWidth = isRTL ? (padding?.right ?? 0) : (padding?.left ?? 0);

    double height = 0;

    final cellConstraints =
        (constraints as _CustomDataTableConstraints).cellsConstraints;

    final vectorSign = isRTL ? -1 : 1;

    while (child != null) {
      final childParentData = child.parentData as _CustomDataTableRowParentData;

      child.layout(
        cellConstraints![childParentData.cellIndex]!,
        parentUsesSize: true,
      );

      final childSize = child.size;

      double initialOffset = isRTL ? -childSize.width : 0;

      childParentData.offset = Offset(
        (vectorSign * occupiedWidth) + initialOffset,
        padding?.top ?? 0,
      );

      occupiedWidth += childSize.width;

      height = max(
        height,
        childSize.height,
      );

      child = childParentData.nextSibling;
    }

    size = Size(
      occupiedWidth + (padding?.right ?? 0),
      height + (2 * (padding?.bottom ?? 0)),
    );
  }

  @override
  paint(context, offset) {
    defaultPaint(context, offset);
  }
}

class _CustomDataTableConstraints extends BoxConstraints {
  final Map<int, BoxConstraints>? cellsConstraints;
  const _CustomDataTableConstraints({
    this.cellsConstraints,
  });

  get hasCellsSpecified =>
      cellsConstraints != null && cellsConstraints!.isNotEmpty;

  @override
  bool get isNormalized => true;

  @override
  bool get isTight => true;

  @override
  bool operator ==(Object other) {
    bool equal = false;
    if (other is _CustomDataTableConstraints) {
      equal = other.cellsConstraints == cellsConstraints;
    }

    return super == other && equal;
  }
}

class _CustomDataTableRowParentData extends ContainerBoxParentData<RenderBox> {
  int? cellIndex;
}

class CustomDataCell extends StatelessWidget {
  final Widget data;
  final Color? color;
  final Alignment? alignment;
  final EdgeInsets? padding;
  const CustomDataCell({
    this.color,
    required this.data,
    this.alignment,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final configs = TableDefaultConfig.of(context);

    return Container(
      alignment: alignment ??
          configs?.cellsAllignment ??
          _defaultTableConfig.cellsAllignment,
      padding:
          padding ?? configs?.cellsPadding ?? _defaultTableConfig.cellsPadding,
      color: color,
      child: data,
    );
  }
}

class CustomDataTableConfig {
  final EdgeInsets? cellsPadding;
  final Alignment? cellsAllignment;
  final EdgeInsets? rowPaddings;

  CustomDataTableConfig({
    this.cellsPadding,
    this.cellsAllignment,
    this.rowPaddings,
  });

  @override
  bool operator ==(Object other) {
    if (other is CustomDataTableConfig) {
      return other.cellsAllignment == cellsAllignment &&
          other.cellsPadding == cellsPadding &&
          other.rowPaddings == rowPaddings;
    }
    return false;
  }
}

class TableDefaultConfig extends InheritedWidget {
  static CustomDataTableConfig? of(BuildContext context) {
    final configsWidget =
        context.findAncestorWidgetOfExactType<TableDefaultConfig>();
    return configsWidget?.tableConfigs;
  }

  final CustomDataTableConfig? tableConfigs;
  TableDefaultConfig({
    this.tableConfigs,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant TableDefaultConfig oldWidget) {
    return oldWidget.tableConfigs != tableConfigs;
  }
}
