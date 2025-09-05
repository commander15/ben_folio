import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Orientation? orientation;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? spacing;
  final List<Widget> children;

  const ResponsiveLayout({super.key, this.orientation, this.mainAxisAlignment, this.mainAxisSize, this.crossAxisAlignment, this.spacing, required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if ((orientation != null && orientation! == Orientation.portrait) || constraints.maxHeight >= constraints.maxWidth) {
        return Column(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          spacing: spacing ?? 0.0,
          children: children,
        );
      } else {
        return Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          spacing: spacing ?? 0.0,
          children: children,
        );
      }
    });
  }
}