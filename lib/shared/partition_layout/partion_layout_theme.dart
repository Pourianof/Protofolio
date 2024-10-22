import 'package:flutter/material.dart';

class PartionLayoutThemeData {
  final EdgeInsets? rowInsets;
  final double? partionItemGap;
  final bool columanize;
  factory PartionLayoutThemeData({
    EdgeInsets? rowInsets,
    double? partionItemGap,
    bool? columanize,
  }) {
    return PartionLayoutThemeData.raw(
      partionItemGap: partionItemGap ?? 40,
      rowInsets: rowInsets ??
          const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
      columanize: columanize ?? false,
    );
  }

  PartionLayoutThemeData.raw({
    required this.partionItemGap,
    required this.rowInsets,
    required this.columanize,
  });

  @override
  operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }

    final otherTD = other as PartionLayoutThemeData;

    return otherTD.columanize == columanize &&
        otherTD.partionItemGap == partionItemGap &&
        otherTD.rowInsets == rowInsets;
  }
}

class PartionLayoutTheme extends InheritedWidget {
  final PartionLayoutThemeData data;
  const PartionLayoutTheme({
    required this.data,
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(PartionLayoutTheme oldWidget) {
    return oldWidget.data != data;
  }

  static PartionLayoutThemeData? of(BuildContext context) {
    final themeWidet =
        context.dependOnInheritedWidgetOfExactType<PartionLayoutTheme>();

    return themeWidet?.data;
  }
}
