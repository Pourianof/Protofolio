import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Sacaler extends ResponsiveScaledBox {
  const Sacaler({super.key, double? baseOnWidth, required super.child})
      : super(width: baseOnWidth);

  @override
  Widget build(BuildContext context) {
    if (width != null) {
      return LayoutBuilder(
        builder: (context, constraints) {
          MediaQueryData mediaQueryData = MediaQuery.of(context);

          double availableWidth = constraints.maxWidth;
          double availableHeight = constraints.maxHeight;

          double aspectRatio = availableWidth / availableHeight;
          double scaledWidth = width!;
          double scaledHeight = width! / aspectRatio;

          bool overrideMediaQueryData = autoCalculateMediaQueryData &&
              (mediaQueryData.size == Size(availableWidth, availableHeight));

          EdgeInsets scaledViewInsets = getScaledViewInsets(
              mediaQueryData: mediaQueryData,
              screenSize: mediaQueryData.size,
              scaledSize: Size(scaledWidth, scaledHeight));
          EdgeInsets scaledViewPadding = getScaledViewPadding(
              mediaQueryData: mediaQueryData,
              screenSize: mediaQueryData.size,
              scaledSize: Size(scaledWidth, scaledHeight));
          EdgeInsets scaledPadding = getScaledPadding(
              padding: scaledViewPadding, insets: scaledViewInsets);

          Widget childHolder = FittedBox(
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            child: Container(
              width: width,
              height: scaledHeight,
              alignment: Alignment.center,
              child: child,
            ),
          );

          if (width! < availableWidth) {
            childHolder = Transform.scale(
              scale: availableWidth / width!,
              child: childHolder,
            );
          }

          if (overrideMediaQueryData) {
            return MediaQuery(
              data: mediaQueryData.copyWith(
                  size: Size(scaledWidth, scaledHeight),
                  viewInsets: scaledViewInsets,
                  viewPadding: scaledViewPadding,
                  padding: scaledPadding),
              child: childHolder,
            );
          }

          return childHolder;
        },
      );
    }

    return child;
  }
}
