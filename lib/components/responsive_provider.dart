import 'package:flutter/material.dart';

class ResponsiveProvider {
  final double desktopBreakpoint;
  final double tabletBreakpoint;
  final double mobileBreakpoint;

  const ResponsiveProvider({required this.desktopBreakpoint, required this.tabletBreakpoint, required this.mobileBreakpoint});
  factory ResponsiveProvider.global() => const ResponsiveProvider(desktopBreakpoint: 1024, tabletBreakpoint: 600, mobileBreakpoint: 400);

  bool isDesktop(double width, double height, {Orientation? orientation}) {
    return width >= desktopBreakpoint;
 
  }

  bool isTablet(double width, double height, {Orientation? orientation}) {
    return width >= tabletBreakpoint;
  }

  bool isMobile(double width, double height, {Orientation? orientation}) {
    return !isDesktop(width, height, orientation: orientation) && !isTablet(width, height, orientation: orientation);
  }
}