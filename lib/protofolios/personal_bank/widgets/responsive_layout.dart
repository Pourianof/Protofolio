import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileMode;
  final Widget desktopMode;

  const ResponsiveLayout({
    super.key,
    required this.desktopMode,
    required this.mobileMode,
  });

  static isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.isMobile(context) ? mobileMode : desktopMode;
  }
}
